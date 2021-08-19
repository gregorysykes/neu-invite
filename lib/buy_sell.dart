import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:money/order.dart';

class BuySell extends StatefulWidget {
  String type;
  String code;
  @override
  _BuySellState createState() => _BuySellState();

  BuySell({this.type, this.code});
}

class _BuySellState extends State<BuySell> {
  TextEditingController textController;
  TextEditingController lotTextController;
  TextEditingController priceTextController;
  TextEditingController sellLotTextController;
  TextEditingController sellPriceTextController;

  bool isSpecialNotation = true;
  bool acceleration = false;

  //about the company
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

  @override
  Widget build(BuildContext context) {
    if (widget.code != '') {
      textController = new TextEditingController(text: widget.code);
    }

    if (textController.text.length > 0) {
      textController.selection = TextSelection.fromPosition(
          TextPosition(offset: textController.text.length));
    }
    // if (lotTextController.text.length > 0) {
    //   lotTextController.selection = TextSelection.fromPosition(
    //       TextPosition(offset: lotTextController.text.length));
    // }
    // if (priceTextController.text.length > 0) {
    //   priceTextController.selection = TextSelection.fromPosition(
    //       TextPosition(offset: priceTextController.text.length));
    // }
    // if (sellLotTextController.text.length > 0) {
    //   sellLotTextController.selection = TextSelection.fromPosition(
    //       TextPosition(offset: sellLotTextController.text.length));
    // }
    // if (sellPriceTextController.text.length > 0) {
    //   sellPriceTextController.selection = TextSelection.fromPosition(
    //       TextPosition(offset: sellPriceTextController.text.length));
    // }

    return Scaffold(
      appBar: PreferredSize(
          child: NeumorphicAppBar(
            title: NeumorphicText(
              'Buy/Sell',
              style: NeumorphicStyle(
                depth: 5,
                color: Colors.indigo,
              ),
              textStyle: NeumorphicTextStyle(fontWeight: FontWeight.w800),
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
            actions: [],
          ),
          preferredSize: Size.fromHeight(80.0)),
      body: Container(
          child: DefaultTabController(
              length: 3,
              initialIndex: widget.type == 'sell' ? 1 : 0,
              child: Scaffold(
                appBar: TabBar(
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.indigo,
                    unselectedLabelColor: Colors.black45,
                    tabs: <Widget>[
                      Container(
                        width:
                            (MediaQuery.maybeOf(context).size.width - 120) / 3,
                        child: Tab(
                            child: Text('Buy',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w700))),
                      ),
                      Container(
                          width:
                              (MediaQuery.maybeOf(context).size.width - 120) /
                                  3,
                          child: Tab(
                              child: Text('Sell',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)))),
                      Container(
                          width:
                              (MediaQuery.maybeOf(context).size.width - 120) /
                                  3,
                          child: Tab(
                              child: Text('Orders',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700))))
                    ]),
                body: TabBarView(
                  children: <Widget>[
                    buyPage(),
                    sellPage(),
                    order(),
                  ],
                ),
              ))),
    );
  }

  Widget buyPage() {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 10, 15.0, 15.0),
      child: ListView(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              NeumorphicText(
                'RG',
                style: NeumorphicStyle(depth: 10, color: Colors.black54),
                textStyle: NeumorphicTextStyle(fontWeight: FontWeight.w500),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                width: MediaQuery.maybeOf(context).size.width / 2.5,
                child: Neumorphic(
                  style: NeumorphicStyle(
                      depth: -10,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(20))),
                  child: TextField(
                    controller: textController,
                    cursorColor: Colors.indigo,
                    style: TextStyle(height: 0.9, color: Colors.black45),
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                        border: InputBorder.none,
                        labelText: 'Search Stock',
                        prefixIcon: Icon(
                          Icons.search,
                          size: 18,
                          color: Colors.indigo,
                        )),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: NeumorphicButton(
                    padding: EdgeInsets.all(10),
                    style: NeumorphicStyle(
                        depth: acceleration ? -5 : 5,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(15))),
                    onPressed: () {
                      setState(() {
                        acceleration = !acceleration;
                      });
                    },
                    child: NeumorphicIcon(
                      Icons.sort,
                      style: NeumorphicStyle(
                          color: acceleration ? Colors.red : Colors.black38),
                    )),
              ),
              Container(
                child: NeumorphicButton(
                    padding: EdgeInsets.all(10),
                    style: NeumorphicStyle(
                        depth: isSpecialNotation ? 5 : 0,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(15))),
                    onPressed: () {
                      if (isSpecialNotation) {
                        _specialNotations();
                      } else {
                        return null;
                      }
                    },
                    child: NeumorphicIcon(
                      Icons.warning,
                      style: NeumorphicStyle(
                          depth: 5,
                          color: isSpecialNotation
                              ? Colors.amber[800]
                              : Colors.grey[350]),
                    )),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '800',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    '+20(3.43%)',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.end,
                  ),
                ],
              ))
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Neumorphic(
              style: NeumorphicStyle(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Trading Limit',
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Text(
                          '00.000.000',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    children: [
                      // Expanded(
                      //   child: Text(
                      //     'Price',
                      //     style: TextStyle(
                      //         color: Colors.black54,
                      //         fontWeight: FontWeight.w500),
                      //   ),
                      // ),
                      Expanded(
                        flex: 12,
                        child: Neumorphic(
                          style: NeumorphicStyle(
                              depth: -10,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(20))),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: priceTextController,
                            cursorColor: Colors.indigo,
                            initialValue: '30000',
                            style:
                                TextStyle(height: 0.8, color: Colors.black45),
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                                border: InputBorder.none,
                                labelText: 'Price',
                                prefixIcon: Icon(
                                  Icons.monetization_on,
                                  size: 18,
                                  color: Colors.indigo,
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 12,
                        child: Neumorphic(
                          style: NeumorphicStyle(
                              depth: -10,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(20))),
                          child: TextFormField(
                            controller: lotTextController,
                            cursorColor: Colors.indigo,
                            initialValue: '1',
                            style:
                                TextStyle(height: 0.8, color: Colors.black45),
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                                border: InputBorder.none,
                                labelText: 'Lot',
                                prefixIcon: Icon(
                                  Icons.receipt,
                                  size: 18,
                                  color: Colors.indigo,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    children: [
                      Expanded(
                        child: Neumorphic(
                            padding: EdgeInsets.all(15),
                            style: NeumorphicStyle(
                                depth: -10,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(20))),
                            child: Container(
                              child: Row(
                                children: [
                                  Text('Total',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500)),
                                  Expanded(
                                    child: Text(
                                      'Rp. 000.000.000',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.end,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  NeumorphicButton(
                    style: NeumorphicStyle(
                        color: Colors.green,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    child: Container(
                        width: MediaQuery.maybeOf(context).size.width,
                        child: Text(
                          'Buy',
                          style: TextStyle(
                              color: Colors.grey[350],
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )),
                    onPressed: () {},
                  ),
                ],
              )),
          Padding(padding: EdgeInsets.only(top: 15)),
          NeumorphicButton(
            style: NeumorphicStyle(
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeumorphicIcon(
                  Icons.trending_up,
                  style: NeumorphicStyle(depth: 5, color: Colors.indigo),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                ),
                Text(
                  'View Chart',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black54),
                ),
              ],
            ),
            onPressed: () {},
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          orderBook()
        ],
      ),
    );
  }

  Widget sellPage() {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 10, 15.0, 15.0),
      child: ListView(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              NeumorphicText(
                'RG',
                style: NeumorphicStyle(depth: 10, color: Colors.black54),
                textStyle: NeumorphicTextStyle(fontWeight: FontWeight.w500),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                width: MediaQuery.maybeOf(context).size.width / 2.5,
                child: Neumorphic(
                  style: NeumorphicStyle(
                      depth: -10,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(20))),
                  child: TextField(
                    controller: textController,
                    cursorColor: Colors.indigo,
                    style: TextStyle(height: 0.9, color: Colors.black45),
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                        border: InputBorder.none,
                        labelText: 'Search Stock',
                        prefixIcon: Icon(
                          Icons.search,
                          size: 18,
                          color: Colors.indigo,
                        )),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: NeumorphicButton(
                    padding: EdgeInsets.all(10),
                    style: NeumorphicStyle(
                        depth: acceleration ? -10 : 10,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(15))),
                    onPressed: () {
                      setState(() {
                        acceleration = !acceleration;
                      });
                    },
                    child: NeumorphicIcon(
                      Icons.sort,
                      style: NeumorphicStyle(
                          color: acceleration ? Colors.red : Colors.black38),
                    )),
              ),
              Container(
                child: NeumorphicButton(
                    padding: EdgeInsets.all(10),
                    style: NeumorphicStyle(
                        depth: isSpecialNotation ? 5 : 0,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(15))),
                    onPressed: () {
                      if (isSpecialNotation) {
                        _specialNotations();
                      } else {
                        return null;
                      }
                    },
                    child: NeumorphicIcon(
                      Icons.warning,
                      style: NeumorphicStyle(
                          depth: 5,
                          color: isSpecialNotation
                              ? Colors.amber[800]
                              : Colors.grey[350]),
                    )),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '800',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    '+20(3.43%)',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.end,
                  ),
                ],
              )),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Neumorphic(
              style: NeumorphicStyle(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Available Lot',
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Text(
                          '00.000.000',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    children: [
                      Expanded(
                        flex: 12,
                        child: Neumorphic(
                          style: NeumorphicStyle(
                              depth: -10,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(20))),
                          child: TextFormField(
                            controller: sellPriceTextController,
                            cursorColor: Colors.indigo,
                            initialValue: '30000',
                            style:
                                TextStyle(height: 0.8, color: Colors.black45),
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                                border: InputBorder.none,
                                labelText: 'Price',
                                prefixIcon: Icon(
                                  Icons.monetization_on,
                                  size: 18,
                                  color: Colors.indigo,
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 12,
                        child: Neumorphic(
                          style: NeumorphicStyle(
                              depth: -10,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(20))),
                          child: TextFormField(
                            controller: sellLotTextController,
                            cursorColor: Colors.indigo,
                            initialValue: '1',
                            style:
                                TextStyle(height: 0.8, color: Colors.black45),
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                                border: InputBorder.none,
                                labelText: 'Lot',
                                prefixIcon: Icon(
                                  Icons.receipt,
                                  size: 18,
                                  color: Colors.indigo,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    children: [
                      Expanded(
                        child: Neumorphic(
                            padding: EdgeInsets.all(15),
                            style: NeumorphicStyle(
                                depth: -10,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(20))),
                            child: Container(
                              child: Row(
                                children: [
                                  Text('Total',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500)),
                                  Expanded(
                                    child: Text(
                                      'Rp. 000.000.000',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.end,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  NeumorphicButton(
                    style: NeumorphicStyle(
                        color: Colors.red,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    child: Container(
                        width: MediaQuery.maybeOf(context).size.width,
                        child: Text(
                          'Sell',
                          style: TextStyle(
                              color: Colors.grey[350],
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )),
                    onPressed: () {},
                  ),
                ],
              )),
          Padding(padding: EdgeInsets.only(top: 15)),
          NeumorphicButton(
            style: NeumorphicStyle(
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeumorphicIcon(
                  Icons.trending_up,
                  style: NeumorphicStyle(depth: 5, color: Colors.indigo),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                ),
                Text(
                  'View Chart',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black54),
                ),
              ],
            ),
            onPressed: () {},
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          orderBook()
        ],
      ),
    );
  }
}

Widget orderBook() {
  var money = NumberFormat('#,##0', 'en_US');
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
                          print('${element['offerLot']} @ ${element['offer']}');
                        }),
                      ]))
                  .toList())));
}

Widget order() {
  return Padding(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Container(
          // padding: EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: 40,
              itemBuilder: (context, index) {
                return orderCard(context);
              })));
}

Widget orderCard(context) {
  return Container(
    padding: EdgeInsets.only(top: 7.5, bottom: 5, left: 10, right: 10),
    child: NeumorphicButton(
      style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
      onPressed: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Order()));
      },
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text('Stock',
                      style: TextStyle(fontSize: 12, color: Colors.black54))),
              Expanded(
                  child: Text('Lot',
                      style: TextStyle(fontSize: 12, color: Colors.black54))),
              Expanded(
                  child: Text('Done',
                      style: TextStyle(fontSize: 12, color: Colors.black54))),
              Expanded(
                  child: Text('Price',
                      style: TextStyle(fontSize: 12, color: Colors.black54))),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Text('ASSA',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500))),
              Expanded(
                  child: Text('1,000,000',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500))),
              Expanded(
                  child: Text('10',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500))),
              Expanded(
                  child: Text('00,000',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500))),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
          ),
          Row(
            children: [
              Expanded(
                  child: Text('Type',
                      style: TextStyle(fontSize: 12, color: Colors.black54))),
              Expanded(
                  child: Text('Status',
                      style: TextStyle(fontSize: 12, color: Colors.black54))),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Text('Buy',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500))),
              Expanded(
                  child: Text('Reject',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500))),
            ],
          ),
        ],
      ),
    ),
  );
}
