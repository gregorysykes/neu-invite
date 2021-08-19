import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';
import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:money/buy_sell.dart';
import 'package:money/commodity.dart';
import 'package:money/currency.dart';
import 'package:money/index.dart';
import 'package:money/sectors.dart';
import 'stock_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class IndexData {
  final DateTime time;
  final int price;

  IndexData(this.time, this.price);
}

class _HomeState extends State<Home> {
  var money = NumberFormat('#,##0', 'en_US');
  var percentage = NumberFormat.decimalPercentPattern(decimalDigits: 2);
  var normal = TextStyle(fontSize: 13.0);

  var open;
  var lot;
  var high;
  var low;
  var freq;
  var value;

  var ihsg_price;
  var ihsg_change;

  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.maybeOf(context).size.height /
        MediaQuery.maybeOf(context).size.width;

    var ihsgHeight = 0.0;
    var miniButtonHeight = 0.0;
    var miniButtonPadding = 0.0;
    if (x >= 2) {
      ihsgHeight = MediaQuery.maybeOf(context).size.height * .215;
      miniButtonHeight = MediaQuery.maybeOf(context).size.width * .18;
      miniButtonPadding = 10;
    } else {
      ihsgHeight = MediaQuery.maybeOf(context).size.height * .24;
      miniButtonHeight = MediaQuery.maybeOf(context).size.width * .15;
      miniButtonPadding = 5;
    }

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
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault)
    ];

    var chart = charts.TimeSeriesChart(
      series,
      animate: true,
      domainAxis:
          new charts.DateTimeAxisSpec(renderSpec: new charts.NoneRenderSpec()),
      primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: new charts.NoneRenderSpec(),
          tickProviderSpec:
              new charts.BasicNumericTickProviderSpec(zeroBound: false)),
    );

    var ihsg_detail_font = TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.w500,
      fontSize: 13.0,
    );

    Future<void> _ihsgDetails() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
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
              child: ListBody(
                children: <Widget>[
                  Container(
                      child: Container(
                    width: MediaQuery.maybeOf(context).size.width / 2,
                    // padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'IHSG',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w800),
                            ),
                            Icon(
                              Icons.arrow_drop_up,
                              color: Colors.green,
                            ),
                            Text(
                              '4.740 (12,70%)',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 13.0,
                                  color: Colors.green[700]),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('Index Harga Saham Gabungan', style: normal)
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  height:
                                      MediaQuery.maybeOf(context).size.height *
                                          0.2,
                                  width:
                                      MediaQuery.maybeOf(context).size.width *
                                          .5,
                                  child: chart)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text('Open', style: ihsg_detail_font),
                              ),
                              Expanded(
                                  child: Container(
                                width: double.infinity,
                                child: Text(
                                  //open
                                  '4000.24',
                                  textAlign: TextAlign.values[2],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                              )),
                              Expanded(
                                child: Text('Lot',
                                    textAlign: TextAlign.start,
                                    style: ihsg_detail_font),
                              ),
                              Expanded(
                                  child: Container(
                                width: double.infinity,
                                child: Text(
                                  '1.24B',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text('High', style: ihsg_detail_font),
                              ),
                              Expanded(
                                  child: Container(
                                width: double.infinity,
                                child: Text(
                                  '4000.24',
                                  textAlign: TextAlign.values[2],
                                  style: TextStyle(
                                      color: Colors.green[900], fontSize: 13),
                                ),
                              )),
                              Expanded(
                                child: Text('Value',
                                    textAlign: TextAlign.start,
                                    style: ihsg_detail_font),
                              ),
                              Expanded(
                                  child: Container(
                                width: double.infinity,
                                child: Text(
                                  '9.69T',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                child: Text('Low', style: ihsg_detail_font),
                              ),
                              Expanded(
                                  child: Container(
                                width: double.infinity,
                                child: Text(
                                  '4000.10',
                                  textAlign: TextAlign.values[2],
                                  style: TextStyle(
                                      color: Colors.red[900], fontSize: 13),
                                ),
                              )),
                              Expanded(
                                child: Text('Freq',
                                    textAlign: TextAlign.start,
                                    style: ihsg_detail_font),
                              ),
                              Expanded(
                                  child: Container(
                                width: double.infinity,
                                child: Text(
                                  '231,232',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  )),
                ],
              ),
            ),
            actions: <Widget>[
              NeumorphicButton(
                style: NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(20))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Done',
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          );
        },
      );
    }

    return Container(
        child: RefreshIndicator(
            color: Colors.indigo,
            backgroundColor: Colors.grey[350],
            child: ListView(
              children: <Widget>[
                //buttonsss
                Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 12,
                            child: Container(
                              height: ihsgHeight,
                              child: NeumorphicButton(
                                onPressed: _ihsgDetails,
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'IHSG',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      'Index Harga Saham Gabungan',
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                    ),
                                    Text(
                                      '6000.00',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text('+23(1,23%)',
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green),
                                        textAlign: TextAlign.center),
                                    Container(
                                        height: MediaQuery.maybeOf(context)
                                                .size
                                                .height *
                                            0.1,
                                        width: MediaQuery.maybeOf(context)
                                                .size
                                                .width *
                                            .5,
                                        child: chart)
                                  ],
                                ),
                                style: NeumorphicStyle(
                                    depth: 5,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(20))),
                              ),
                            )),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                            flex: 12,
                            child: Container(
                                height: ihsgHeight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Expanded(
                                            flex: 12,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: miniButtonHeight,
                                                  height: miniButtonHeight,
                                                  child: NeumorphicButton(
                                                      style: NeumorphicStyle(
                                                          depth: 5,
                                                          boxShape: NeumorphicBoxShape
                                                              .roundRect(
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Sectors()));
                                                      },
                                                      child: Padding(
                                                          padding: EdgeInsets.all(
                                                              miniButtonPadding),
                                                          child: NeumorphicIcon(
                                                            Icons.pie_chart,
                                                            size: 30,
                                                            style:
                                                                NeumorphicStyle(
                                                              color:
                                                                  Colors.indigo,
                                                            ),
                                                          ))),
                                                ),
                                                Container(
                                                  child: Text(
                                                    'Sector',
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  padding:
                                                      EdgeInsets.only(top: 2.5),
                                                )
                                              ],
                                            )),
                                        Expanded(
                                          child: Container(),
                                          flex: 1,
                                        ),
                                        Expanded(
                                            flex: 12,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: miniButtonHeight,
                                                  height: miniButtonHeight,
                                                  child: NeumorphicButton(
                                                      style: NeumorphicStyle(
                                                          depth: 5,
                                                          boxShape: NeumorphicBoxShape
                                                              .roundRect(
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Index()));
                                                      },
                                                      child: Padding(
                                                          padding: EdgeInsets.all(
                                                              miniButtonPadding),
                                                          child: NeumorphicIcon(
                                                            Icons
                                                                .bar_chart_rounded,
                                                            size: 30,
                                                            style:
                                                                NeumorphicStyle(
                                                              color:
                                                                  Colors.indigo,
                                                            ),
                                                          ))),
                                                ),
                                                Container(
                                                  child: Text(
                                                    'Index',
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  padding:
                                                      EdgeInsets.only(top: 2.5),
                                                )
                                              ],
                                            )),
                                      ],
                                    )),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 12,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: miniButtonHeight,
                                                  height: miniButtonHeight,
                                                  child: NeumorphicButton(
                                                      style: NeumorphicStyle(
                                                          depth: 5,
                                                          boxShape: NeumorphicBoxShape
                                                              .roundRect(
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Commodity()));
                                                      },
                                                      child: Padding(
                                                          padding: EdgeInsets.all(
                                                              miniButtonPadding),
                                                          child: NeumorphicIcon(
                                                            Icons
                                                                .invert_colors_rounded,
                                                            size: 30,
                                                            style:
                                                                NeumorphicStyle(
                                                              color:
                                                                  Colors.indigo,
                                                            ),
                                                          ))),
                                                ),
                                                Container(
                                                  child: Text(
                                                    'Commodity',
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  padding:
                                                      EdgeInsets.only(top: 2.5),
                                                )
                                              ],
                                            )),
                                        Expanded(
                                          child: Container(),
                                          flex: 1,
                                        ),
                                        Expanded(
                                            flex: 12,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: miniButtonHeight,
                                                  height: miniButtonHeight,
                                                  child: NeumorphicButton(
                                                      style: NeumorphicStyle(
                                                          depth: 5,
                                                          boxShape: NeumorphicBoxShape
                                                              .roundRect(
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Currency()));
                                                      },
                                                      child: Padding(
                                                          padding: EdgeInsets.all(
                                                              miniButtonPadding),
                                                          child: NeumorphicIcon(
                                                            Icons
                                                                .account_balance,
                                                            size: 30,
                                                            style:
                                                                NeumorphicStyle(
                                                              color:
                                                                  Colors.indigo,
                                                            ),
                                                          ))),
                                                ),
                                                Container(
                                                  child: Text(
                                                    'Currency',
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  padding:
                                                      EdgeInsets.only(top: 2.5),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  ],
                                ))),
                      ],
                    )),

                Container(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
                    child: Neumorphic(
                      padding: EdgeInsets.all(15),
                      style: NeumorphicStyle(
                          depth: -5,
                          lightSource: LightSource.topLeft,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Trading Limit: ',
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Rp. 100.000.000',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                          ),
                          Row(
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
                                                  )));
                                    },
                                    padding: EdgeInsets.all(13.6),
                                    child: Text('Buy',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500))),
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
                                                  )));
                                    },
                                    padding: EdgeInsets.all(13.6),
                                    child: Text('Sell',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500))),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),

                Container(
                    padding: EdgeInsets.only(top: 5, left: 15),
                    width: MediaQuery.maybeOf(context).size.width,
                    height: MediaQuery.maybeOf(context).size.height * 0.5,
                    child: DefaultTabController(
                        length: 3,
                        child: Scaffold(
                          appBar: TabBar(
                              indicatorColor: Colors.transparent,
                              labelColor: Colors.indigo,
                              unselectedLabelColor: Colors.black45,
                              tabs: <Widget>[
                                Container(
                                  width:
                                      (MediaQuery.maybeOf(context).size.width -
                                              120) /
                                          3,
                                  child: Tab(
                                    child: Column(
                                      children: [
                                        Icon(Icons.query_builder),
                                        Padding(
                                          padding: EdgeInsets.only(top: 2),
                                        ),
                                        Text('Most Active',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700))
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                    width: (MediaQuery.maybeOf(context)
                                                .size
                                                .width -
                                            120) /
                                        3,
                                    child: Tab(
                                      child: Column(
                                        children: [
                                          Icon(Icons.trending_up),
                                          Padding(
                                            padding: EdgeInsets.only(top: 2),
                                          ),
                                          Text('Gainer',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700))
                                        ],
                                      ),
                                    )),
                                Container(
                                    width: (MediaQuery.maybeOf(context)
                                                .size
                                                .width -
                                            120) /
                                        3,
                                    child: Tab(
                                      child: Column(
                                        children: [
                                          Icon(Icons.trending_down),
                                          Padding(
                                            padding: EdgeInsets.only(top: 2),
                                          ),
                                          Text('Losers',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700))
                                        ],
                                      ),
                                    ))
                              ]),
                          body: TabBarView(
                            children: <Widget>[
                              mostActive(),
                              topGainer(),
                              topLosers(),
                            ],
                          ),
                        ))),
              ],
            ),
            onRefresh: () {
              print('refreshed');
            }));
  }
}

Widget mostActive() {
  return Container(
      child: Container(
    padding: EdgeInsets.fromLTRB(5, 15, 15, 15),
    child: Neumorphic(
        style: NeumorphicStyle(
            depth: -10,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return stockCard(
                  'BBCA', 'Bank Central Asia', 31000, -800, context);
            })),
  ));
}

Widget topGainer() {
  return Container(
      child: Container(
    padding: EdgeInsets.fromLTRB(5, 15, 15, 15),
    child: Neumorphic(
        style: NeumorphicStyle(
            depth: -10,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return stockCard(
                  'BBCA', 'Bank Central Asia', 31000, -800, context);
            })),
  ));
}

Widget topLosers() {
  return Container(
      child: Container(
    padding: EdgeInsets.fromLTRB(5, 15, 15, 15),
    child: Neumorphic(
        style: NeumorphicStyle(
            depth: -10,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return stockCard(
                  'BBCA', 'Bank Central Asia', 31000, -800, context);
            })),
  ));
}

Widget stockCard(
    String code, String name, int price, int change, BuildContext context) {
  return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
      child: NeumorphicButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StockPage(code: code)));
        },
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Row(children: [
                Text(
                  code,
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                      fontSize: 13),
                ),
                Expanded(
                  child: Text(
                    price.toString(),
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                    textAlign: TextAlign.end,
                  ),
                )
              ]),
              Row(children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                ),
                Expanded(
                  child: Text(
                    change.toString(),
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                    textAlign: TextAlign.end,
                  ),
                )
              ]),
            ],
          ),
        ),
      ));
}
