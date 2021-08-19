import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:money/buy_sell.dart';
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:url_launcher/url_launcher.dart';

class StockPage extends StatefulWidget {
  String code;

  StockPage({this.code});
  @override
  _StockPageState createState() => _StockPageState();
}

class IndexData {
  final DateTime time;
  final int price;

  IndexData(this.time, this.price);
}

class _StockPageState extends State<StockPage> {
  var isLoading = true;
  var isFav = false;
  var isSpecialNotation = true;

  Map<String, dynamic> list;
  Map<String, dynamic> feeds;
  Map<String, dynamic> news;
  var color;
  var icon;
  var money = NumberFormat('#,##0', 'en_US');
  var percentage = NumberFormat.decimalPercentPattern(decimalDigits: 2);
  var compact = NumberFormat.compact();
  var ihsg_detail_font = TextStyle(color: Colors.black45, fontSize: 13);

  TextEditingController priceController;

  // IO.Socket socket = IO.io('http://10.0.2.2:3000', <String, dynamic>{
  IO.Socket socket = IO.io('http://localhost:3000', <String, dynamic>{
    'transports': ['websocket'],
    'forceNew': true
  });
  int length = 0;

  Future<void> _stockAlert({int price}) async {
    bool isEqual = false;
    bool isGreater = false;
    bool isLess = false;
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            scrollable: false,
            contentTextStyle:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            titleTextStyle:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w700),
            buttonPadding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            backgroundColor: Colors.grey[350],
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    'Stock Alert',
                    style: TextStyle(color: Colors.indigo),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    children: [
                      Expanded(child: Container(), flex: 1),
                      Expanded(
                        child: NeumorphicButton(
                          style: NeumorphicStyle(depth: isEqual ? -5 : 5),
                          child: Text('=',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54)),
                          onPressed: () {
                            setState(() {
                              isEqual = !isEqual;
                              isGreater = false;
                              isLess = false;
                            });
                          },
                        ),
                        flex: 3,
                      ),
                      Expanded(child: Container(), flex: 1),
                      Expanded(
                        child: NeumorphicButton(
                          style: NeumorphicStyle(depth: isGreater ? -5 : 5),
                          child: Text('>',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54)),
                          onPressed: () {
                            setState(() {
                              isEqual = false;
                              isGreater = !isGreater;
                              isLess = false;
                            });
                          },
                        ),
                        flex: 3,
                      ),
                      Expanded(child: Container(), flex: 1),
                      Expanded(
                        child: NeumorphicButton(
                          style: NeumorphicStyle(depth: isLess ? -5 : 5),
                          child: Text('<',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54)),
                          onPressed: () {
                            setState(() {
                              isEqual = false;
                              isGreater = false;
                              isLess = !isLess;
                            });
                          },
                        ),
                        flex: 3,
                      ),
                      Expanded(child: Container(), flex: 1),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
                      child: Neumorphic(
                        style: NeumorphicStyle(
                            depth: -10,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(20))),
                        child: TextField(
                          controller: priceController,
                          cursorColor: Colors.indigo,
                          style: TextStyle(height: 0.9, color: Colors.black45),
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13),
                              border: InputBorder.none,
                              labelText: 'Stock Price',
                              prefixIcon: Icon(
                                Icons.monetization_on,
                                size: 18,
                                color: Colors.indigo,
                              )),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: NeumorphicButton(
                      style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.alarm_add,
                            size: 18,
                            color: Colors.indigo,
                          ),
                          Padding(padding: EdgeInsets.only(left: 5)),
                          Text('Set Alert',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.indigo))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Future<void> _specialNotations() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: false,
          contentTextStyle:
              TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
          titleTextStyle:
              TextStyle(color: Colors.black54, fontWeight: FontWeight.w700),
          buttonPadding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          backgroundColor: Colors.grey[350],
          // title: Text('#IHSG'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'Special Notations',
                  style: TextStyle(color: Colors.indigo),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Container(
                  height: MediaQuery.maybeOf(context).size.height / 6,
                  width: MediaQuery.maybeOf(context).size.width,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text('E - Lorem Ipsum'),
                      );
                    },
                    itemCount: 5,
                  ),
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _fetchData() async {
    // _getFeeds();
    socket.emit('stockPrice', widget.code);
    socket.on('connect', (_) {
      socket.on('stockQuote', (jsonData) {
        setState(() {
          list = jsonData;
          isLoading = false;

          if (list['change'] < 0) {
            color = Colors.red;
            icon = Icons.arrow_downward;
          } else if (list['change'] > 0) {
            color = Colors.green;
            icon = Icons.arrow_upward;
          } else if (list['change'] == 0) {
            color = Colors.black45;
            icon = Icons.circle;
          }
        });
      });
    });
  }

  _getFeeds() async {
    final response = await http.get(
        "https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=61ae7bd3db18402493d9132fad89bd36");
    if (response.statusCode == 200) {
      feeds = jsonDecode(response.body.toString());
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  initState() {
    _getFeeds();
    _fetchData();
    super.initState();
  }

  @override
  dispose() {
    print('bye_2');
    socket.emit('disconnect');
    super.dispose();
  }

  Widget chartCard(
      {int price,
      int change,
      int open,
      int high,
      int low,
      int lot,
      int value,
      int buy_f,
      int sell_f,
      int average}) {
    var data = [
      IndexData(new DateTime(2020, 4, 7, 9, 0), 4390),
      IndexData(new DateTime(2020, 4, 7, 9, 15), 4392),
      IndexData(new DateTime(2020, 4, 7, 9, 30), 4380),
      IndexData(new DateTime(2020, 4, 7, 9, 45), 4590),
      IndexData(new DateTime(2020, 4, 7, 10, 0), 4598),
      IndexData(new DateTime(2020, 4, 7, 10, 15), 4600),
      IndexData(new DateTime(2020, 4, 7, 10, 30), 4602),
      IndexData(new DateTime(2020, 4, 7, 10, 45), 4615),
      IndexData(new DateTime(2020, 4, 7, 11, 0), 4607),
      IndexData(new DateTime(2020, 4, 7, 11, 15), 4690),
      IndexData(new DateTime(2020, 4, 7, 11, 30), 4688),
      IndexData(new DateTime(2020, 4, 7, 11, 45), 4670),
      IndexData(new DateTime(2020, 4, 7, 13, 30), 4670),
      IndexData(new DateTime(2020, 4, 7, 13, 45), 4667),
      IndexData(new DateTime(2020, 4, 7, 14, 0), 4656),
      IndexData(new DateTime(2020, 4, 7, 14, 15), 4678),
      IndexData(new DateTime(2020, 4, 7, 14, 30), 4699),
      IndexData(new DateTime(2020, 4, 7, 14, 45), 4700),
      IndexData(new DateTime(2020, 4, 7, 15, 0), 4732),
      IndexData(new DateTime(2020, 4, 7, 15, 15), 4722),
      IndexData(new DateTime(2020, 4, 7, 15, 30), 4730),
      IndexData(new DateTime(2020, 4, 7, 15, 45), 4734),
      IndexData(new DateTime(2020, 4, 7, 16, 0), 4740)
    ];

    var series = [
      charts.Series(
          id: 'Index',
          domainFn: (IndexData index, _) => index.time,
          measureFn: (IndexData index, _) => index.price,
          data: data,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault)
    ];

    var chart = charts.TimeSeriesChart(
      series,
      animate: true,
      primaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec: new charts.BasicNumericTickProviderSpec(
        zeroBound: false,
      )),
    );

    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Neumorphic(
          child: Container(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Text(list['name']),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(widget.code,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          // money.format(list['price']),
                          money.format(31000),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: NeumorphicIcon(
                          Icons.arrow_upward,
                          size: 13,
                          style: NeumorphicStyle(color: Colors.green),
                        ),
                      ),
                      Text(
                        // money.format(list['change']) +
                        money.format(200) + ' (' + percentage.format(
                            // list['change'] / (list['change'] + list['price'])) +
                            200 / (200 + 31000)) + ')',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w500),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 5),
                          child: NeumorphicButton(
                            style: NeumorphicStyle(
                                depth: isSpecialNotation ? 5 : 0),
                            onPressed: () {
                              if (isSpecialNotation) {
                                _specialNotations();
                              } else {
                                return null;
                              }
                            },
                            padding: EdgeInsets.all(3),
                            // style: NeumorphicStyle(depth: -10),
                            child: NeumorphicIcon(
                              Icons.warning,
                              size: 14,
                              style: NeumorphicStyle(
                                color: isSpecialNotation
                                    ? Colors.amber[800]
                                    : Colors.grey[350],
                              ),
                            ),
                          ))
                    ],
                  ),
                  Text('Bank Central Asia',
                      style: TextStyle(
                        color: Colors.black45,
                      )),

                  Container(
                    height: MediaQuery.maybeOf(context).size.height * 0.25,
                    width: MediaQuery.maybeOf(context).size.width,
                    child: chart,
                    padding: EdgeInsets.only(bottom: 15.0),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Open',
                            style:
                                TextStyle(color: Colors.black45, fontSize: 13)),
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(right: 5),
                        width: double.infinity,
                        child: Text(
                            // money.format(list['open']),
                            money.format(30800),
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 13)),
                      )),
                      Expanded(
                        child: Text('Lot',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(color: Colors.black45, fontSize: 13)),
                      ),
                      Expanded(
                          child: Container(
                        width: double.infinity,
                        child: Text(
                            // money.format(list['lot'] / 100),
                            money.format(20000000 / 100),
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 13)),
                      )),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('High',
                            style:
                                TextStyle(color: Colors.black45, fontSize: 13)),
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(right: 5),
                        width: double.infinity,
                        child: Text(
                          // money.format(list['high']),
                          money.format(31200),
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.green, fontSize: 13),
                        ),
                      )),
                      Expanded(
                        child: Text('Value',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(color: Colors.black45, fontSize: 13)),
                      ),
                      Expanded(
                          child: Container(
                        width: double.infinity,
                        child: Text(
                            // compact.format(list['value']),
                            compact.format(23812937384),
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 13)),
                      )),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text('Low',
                            style:
                                TextStyle(color: Colors.black45, fontSize: 13)),
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(right: 5),
                        width: double.infinity,
                        child: Text(
                          // money.format(list['low']),
                          money.format(30700),
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.red, fontSize: 13),
                        ),
                      )),
                      Expanded(
                        child: Text('Average',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(color: Colors.black45, fontSize: 13)),
                      ),
                      Expanded(
                          child: Container(
                        width: double.infinity,
                        child: Text(
                            // money.format(list['average']),
                            money.format(31100),
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 13)),
                      )),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: Text('F Buy',
                            style:
                                TextStyle(color: Colors.black45, fontSize: 13)),
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(right: 5),
                        width: double.infinity,
                        child: Text(compact.format(28129237384),
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 13)),
                      )),
                      Expanded(
                        child: Text('F Sell',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(color: Colors.black45, fontSize: 13)),
                      ),
                      Expanded(
                          child: Container(
                        width: double.infinity,
                        child: Text(compact.format(38129237384),
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 13)),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          style: NeumorphicStyle(
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(20.0))),
        ));
  }

  Widget orderBook() {
    List<Map<String, int>> orderBook;

    orderBook = [
      {'bidLot': 87, 'bid': 30000, 'offer': 31000, 'offerLot': 23432},
      {'bidLot': 67367, 'bid': 29000, 'offer': 32000, 'offerLot': 23},
      {'bidLot': 87, 'bid': 29000, 'offer': 33000, 'offerLot': 34},
      {'bidLot': 565, 'bid': 27000, 'offer': 34000, 'offerLot': 71},
      {'bidLot': 436, 'bid': 26000, 'offer': 35000, 'offerLot': 564},
      {'bidLot': 2345, 'bid': 25000, 'offer': 36000, 'offerLot': 23},
      {'bidLot': 87, 'bid': 24000, 'offer': 37000, 'offerLot': 65},
      {'bidLot': 35, 'bid': 23000, 'offer': 38000, 'offerLot': 34},
      {'bidLot': 45, 'bid': 22000, 'offer': 39000, 'offerLot': 22},
      {'bidLot': 65, 'bid': 21000, 'offer': 40000, 'offerLot': 87534},
    ];

    return Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Neumorphic(
            style: NeumorphicStyle(
                color: Colors.grey[350],
                depth: -10,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
            padding: EdgeInsets.all(5),
            child: DataTable(
                dataRowHeight: 30,
                headingRowHeight: 30,
                columnSpacing: 40,
                columns: [
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    'Lot',
                    textAlign: TextAlign.start,
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    'Bid',
                    textAlign: TextAlign.center,
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    'Offer',
                    textAlign: TextAlign.center,
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    'Lot',
                    textAlign: TextAlign.end,
                  ))),
                ],
                rows: orderBook
                    .map((element) => DataRow(cells: [
                          DataCell(
                              Text(
                                money.format(element["bidLot"]),
                                // textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 13),
                              ), onTap: () {
                            print('${element['bidLot']} @ ${element['bid']}');
                          }),
                          DataCell(Center(
                              child: Text(
                            money.format(element['bid']),
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13,
                                color: (element['bid'] == 31000)
                                    ? Colors.black54
                                    : (element['bid'] > 31000)
                                        ? Colors.green
                                        : Colors.red),
                          ))),
                          DataCell(Center(
                              child: Text(
                            money.format(element['offer']),
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13,
                                color: (element['offer'] == 31000)
                                    ? Colors.black54
                                    : (element['offer'] > 31000)
                                        ? Colors.green
                                        : Colors.red),
                          ))),
                          DataCell(
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(money.format(element['offerLot']),
                                      // textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 13,
                                      ))), onTap: () {
                            print(
                                '${element['offerLot']} @ ${element['offer']}');
                          }),
                        ]))
                    .toList())));
  }

  Widget brokerSummary() {
    List<Map<String, dynamic>> brokerSummary;

    brokerSummary = [
      {
        'b': 'CC',
        'bVal': 30000,
        'bAvg': 31000,
        'bLot': 766900,
        's': 'CC',
        'sVal': 30000,
        'sAvg': 31000,
        'sLot': 234326
      },
      {
        'b': 'IN',
        'bVal': 29000,
        'bAvg': 32000,
        'bLot': 895834,
        's': 'CC',
        'sVal': 30000,
        'sAvg': 31000,
        'sLot': 234321
      },
      {
        'b': 'CC',
        'bVal': 29000,
        'bAvg': 33000,
        'bLot': 347839,
        's': 'CC',
        'sVal': 30000,
        'sAvg': 31000,
        'sLot': 234327
      },
      {
        'b': 'YP',
        'bVal': 27000,
        'bAvg': 34000,
        'bLot': 71,
        's': 'CC',
        'sVal': 30000,
        'sAvg': 31000,
        'sLot': 23432
      },
      {
        'b': 'IN',
        'bVal': 26000,
        'bAvg': 35000,
        'bLot': 564,
        's': 'CC',
        'sVal': 30000,
        'sAvg': 31000,
        'sLot': 23432
      },
      {
        'b': 'YP',
        'bVal': 25000,
        'bAvg': 36000,
        'bLot': 23,
        's': 'CC',
        'sVal': 30000,
        'sAvg': 31000,
        'sLot': 23432
      },
      {
        'b': 'AN',
        'bVal': 24000,
        'bAvg': 37000,
        'bLot': 65,
        's': 'CC',
        'sVal': 30000,
        'sAvg': 31000,
        'sLot': 23432
      },
      {
        'b': 'IN',
        'bVal': 23000,
        'bAvg': 38000,
        'bLot': 34,
        's': 'CC',
        'sVal': 30000,
        'sAvg': 31000,
        'sLot': 23432
      },
      {
        'b': 'AN',
        'bVal': 22000,
        'bAvg': 39000,
        'bLot': 22,
        's': 'CC',
        'sVal': 30000,
        'sAvg': 31000,
        'sLot': 23432
      },
      {
        'b': 'YP',
        'bVal': 21000,
        'bAvg': 40000,
        'bLot': 87534,
        's': 'CC',
        'sVal': 30000,
        'sAvg': 31000,
        'sLot': 23432
      },
    ];

    return Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Neumorphic(
            style: NeumorphicStyle(
                color: Colors.grey[350],
                depth: -10,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
            padding: EdgeInsets.all(5),
            child: DataTable(
                dataRowHeight: 30,
                horizontalMargin: 0,
                headingRowHeight: 30,
                columnSpacing: 2,
                columns: [
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    'B',
                    textAlign: TextAlign.center,
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    'B.Val',
                    textAlign: TextAlign.center,
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    'B.Avg',
                    textAlign: TextAlign.center,
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    'B.Lot',
                    textAlign: TextAlign.center,
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    'S',
                    textAlign: TextAlign.center,
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    'S.Val',
                    textAlign: TextAlign.center,
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    'S.Avg',
                    textAlign: TextAlign.center,
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    'S.Lot',
                    textAlign: TextAlign.center,
                  ))),
                ],
                rows: brokerSummary
                    .map((element) => DataRow(cells: [
                          DataCell(Center(
                              child: Text(
                            element["b"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.orange[500], fontSize: 12),
                          ))),
                          DataCell(Center(
                              child: Text(
                            money.format(element['bVal']),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          ))),
                          DataCell(Center(
                              child: Text(
                            money.format(element['bAvg']),
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 12),
                          ))),
                          DataCell(Center(
                              child: Text(
                            money.format(element['bLot']),
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 12),
                          ))),
                          DataCell(Center(
                              child: Text(element["s"],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.green[600],
                                      fontSize: 12)))),
                          DataCell(Center(
                              child: Text(
                            money.format(element['sVal']),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          ))),
                          DataCell(Center(
                              child: Text(
                            money.format(element['sAvg']),
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 12),
                          ))),
                          DataCell(Center(
                              child: Text(
                            money.format(element['sLot']),
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 12),
                          ))),
                        ]))
                    .toList())));
  }

  Widget doneSummary() {
    List<Map<String, int>> doneSummary;

    doneSummary = [
      {'sLot': 87, 'price': 34000, 'bLot': 37000, 'totalLot': 65},
      {'sLot': 35, 'price': 33000, 'bLot': 38000, 'totalLot': 34},
      {'sLot': 45, 'price': 32000, 'bLot': 39000, 'totalLot': 22},
      {'sLot': 65, 'price': 31000, 'bLot': 40000, 'totalLot': 87534},
      {'sLot': 87, 'price': 30000, 'bLot': 31000, 'totalLot': 23432},
      {'sLot': 67367, 'price': 29000, 'bLot': 32000, 'totalLot': 23},
      {'sLot': 87, 'price': 29000, 'bLot': 33000, 'totalLot': 34},
      {'sLot': 565, 'price': 27000, 'bLot': 34000, 'totalLot': 71},
      {'sLot': 436, 'price': 26000, 'bLot': 35000, 'totalLot': 564},
      {'sLot': 2345, 'price': 25000, 'bLot': 36000, 'totalLot': 23},
    ];

    return Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Neumorphic(
            style: NeumorphicStyle(
                color: Colors.grey[350],
                depth: -10,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
            padding: EdgeInsets.all(5),
            child: DataTable(
                dataRowHeight: 30,
                headingRowHeight: 30,
                columnSpacing: 30,
                columns: [
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    'Price',
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    'S.Lot',
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    'B.Lot',
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    'Total',
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ))),
                ],
                rows: doneSummary
                    .map((element) => DataRow(cells: [
                          DataCell(Center(
                              child: Text(
                            money.format(element["price"]),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13,
                                color: (element['price'] == 31000)
                                    ? Colors.black54
                                    : (element['price'] > 31000)
                                        ? Colors.green
                                        : Colors.red),
                          ))),
                          DataCell(Center(
                              child: Text(
                            money.format(element['sLot']),
                            style: TextStyle(fontSize: 13),
                            textAlign: TextAlign.center,
                          ))),
                          DataCell(Center(
                              child: Text(
                            money.format(element['bLot']),
                            style: TextStyle(fontSize: 13),
                            textAlign: TextAlign.end,
                          ))),
                          DataCell(Center(
                              child: Text(
                            money.format(element['totalLot']),
                            style: TextStyle(fontSize: 13),
                            textAlign: TextAlign.end,
                          ))),
                        ]))
                    .toList())));
  }

  Widget post(String username, String post, String profilePic) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
        child: Neumorphic(
            padding: EdgeInsets.all(15),
            style: NeumorphicStyle(
                color: Colors.grey[350],
                depth: 10,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(username),
                    Container(
                      width: MediaQuery.maybeOf(context).size.width * .6,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        post,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 8,
                        style: TextStyle(
                            color: Colors.black54, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  Widget newsPost(String title, String post) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
        child: Neumorphic(
            padding: EdgeInsets.all(15),
            style: NeumorphicStyle(
                color: Colors.grey[350],
                depth: 10,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.label_important,
                          color: Colors.amber[800],
                        ),
                        Text(
                          title,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.maybeOf(context).size.width * .6,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        post,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 8,
                        style: TextStyle(
                            color: Colors.black54, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  Widget stockFeeds() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Neumorphic(
          style: NeumorphicStyle(
              color: Colors.grey[350],
              depth: -10,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
          child: ListView.builder(
            itemCount: feeds.length * 5,
            itemBuilder: (context, index) {
              return post('User', feeds['articles'][index]['description'],
                  feeds['articles'][index]['urlToImage']);
            },
          ),
        ));
  }

  Widget stockNews() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Neumorphic(
          style: NeumorphicStyle(
              color: Colors.grey[350],
              depth: -10,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
          child: ListView.builder(
            itemCount: 25,
            itemBuilder: (context, index) {
              return newsPost('title', 'subtitle');
            },
          ),
        ));
  }

  Widget profile(String stockName) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(stockName,
              style: TextStyle(
                  color: Colors.black54, fontWeight: FontWeight.w800)),
          Text('lorem ipsum dolor sit amet',
              style: TextStyle(
                  color: Colors.black54, fontWeight: FontWeight.w500)),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.maybeOf(context).size.width,
            child: NeumorphicButton(
              style: NeumorphicStyle(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
              child: Text('View More',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w500)),
              onPressed: () {
                launch('https://google.com');
              },
            ),
          )
        ],
      ),
    );
  }

  Widget stockDetails() {
    return Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        height: MediaQuery.maybeOf(context).size.height * 0.5,
        child: DefaultTabController(
            length: 6,
            child: Scaffold(
              appBar: TabBar(
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.indigo,
                  unselectedLabelColor: Colors.black45,
                  isScrollable: true,
                  tabs: <Widget>[
                    Tab(child: Text('Order Book')),
                    Tab(child: Text('Broker Summary')),
                    Tab(child: Text('Done Summary')),
                    Tab(child: Text('Feeds')),
                    Tab(child: Text('News')),
                    Tab(child: Text('Profile')),
                  ]),
              body: TabBarView(
                children: <Widget>[
                  orderBook(),
                  brokerSummary(),
                  doneSummary(),
                  stockFeeds(),
                  stockNews(),
                  profile('Bank Central Asia')
                ],
              ),
            )));
  }

  Widget buySellButton() {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: Row(
          children: [
            Expanded(
              flex: 12,
              child: NeumorphicButton(
                  style: NeumorphicStyle(
                      color: Colors.green,
                      depth: 10,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(20))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuySell(
                                  type: 'buy',
                                  code: widget.code,
                                )));
                  },
                  padding: EdgeInsets.all(13.6),
                  child: Text('Buy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500))),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 12,
              child: NeumorphicButton(
                  style: NeumorphicStyle(
                      color: Colors.red,
                      depth: 10,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(20))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuySell(
                                  type: 'sell',
                                  code: widget.code,
                                )));
                  },
                  padding: EdgeInsets.all(13.6),
                  child: Text('Sell',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500))),
            ),
          ],
        ));
  }

  Widget viewChartButton() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: NeumorphicButton(
        style: NeumorphicStyle(
            depth: 10,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeumorphicIcon(
              Icons.trending_up,
              style: NeumorphicStyle(color: Colors.indigo),
            ),
            Text(
              ' View Chart',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: NeumorphicAppBar(
            title: NeumorphicText(
              widget.code,
              style: NeumorphicStyle(
                depth: 5,
                color: Colors.black45,
              ),
              textStyle: NeumorphicTextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            buttonStyle: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape: NeumorphicBoxShape.circle(),
                depth: 5,
                color: Colors.grey[350]),
            iconTheme: IconThemeData(
              color: Colors.black45,
              size: 18,
            ),
            buttonPadding: EdgeInsets.all(0),
            actions: [
              NeumorphicButton(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NeumorphicIcon(
                      Icons.favorite,
                      style: NeumorphicStyle(
                          color: isFav ? Colors.red : Colors.black45),
                    ),
                  ],
                ),
                style: NeumorphicStyle(
                    shape: NeumorphicShape.convex,
                    boxShape: NeumorphicBoxShape.circle(),
                    color: Colors.grey[350],
                    depth: isFav ? -5 : 5),
                onPressed: () {
                  setState(() {
                    isFav = !isFav;
                  });
                },
              ),
              NeumorphicButton(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NeumorphicIcon(
                      Icons.alarm_add,
                      style: NeumorphicStyle(color: Colors.indigo),
                    ),
                  ],
                ),
                style: NeumorphicStyle(
                    shape: NeumorphicShape.convex,
                    boxShape: NeumorphicBoxShape.circle(),
                    color: Colors.grey[350],
                    depth: 10),
                onPressed: () {
                  _stockAlert();
                },
              ),
            ],
          ),
          preferredSize: Size.fromHeight(80.0)),
      body: Container(
          // child: isLoading
          child: isLoading
              ? Center(
                  child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: NeumorphicProgressIndeterminate(
                        style: ProgressStyle(accent: Colors.indigo),
                      )))
              : Column(
                  children: <Widget>[
                    Expanded(
                        child: RefreshIndicator(
                            child: ListView(
                              children: <Widget>[
                                chartCard(),
                                viewChartButton(),
                                buySellButton(),
                                stockDetails()
                              ],
                            ),
                            onRefresh: () {
                              // _fetchData();
                            })),
                  ],
                )),
    );
  }
}
