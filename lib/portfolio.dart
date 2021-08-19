import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:money/buy_sell.dart';
import 'package:money/order.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:money/profile.dart';
import 'package:money/settlement.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
  int page = 0;
  Portfolio({this.page});
}

class _PortfolioState extends State<Portfolio> {
  var money = NumberFormat('#,##0', 'en_US');
  var percentage = NumberFormat.decimalPercentPattern(decimalDigits: 2);
  var fontSize = 13.0;
  var baseColor = Colors.black54;
  var baseWeight = FontWeight.w500;

  TextEditingController textController;
  TextEditingController lotTextController;
  TextEditingController priceTextController;
  TextEditingController sellLotTextController;
  TextEditingController sellPriceTextController;
  Widget top() {
    return Column(
      children: [
        Row(children: [
          Expanded(
            flex: 12,
            child: Text('Trading Balance',
                style: TextStyle(fontSize: fontSize, color: Colors.black45)),
          ),
          Expanded(
            flex: 12,
            child: Text('Trading Limit',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSize, color: Colors.black45)),
          ),
          Expanded(
            flex: 12,
            child: Text('Open',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: fontSize, color: Colors.black45)),
          ),
        ]),

        //first row value
        Row(children: [
          Expanded(
            flex: 12,
            child: Text(money.format(12345),
                style: TextStyle(
                    fontSize: fontSize,
                    color: baseColor,
                    fontWeight: baseWeight)),
          ),
          Expanded(
            flex: 12,
            child: Text(money.format(12345),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: fontSize,
                    color: baseColor,
                    fontWeight: baseWeight)),
          ),
          Expanded(
            flex: 12,
            child: Text(money.format(12345),
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: fontSize,
                    color: baseColor,
                    fontWeight: baseWeight)),
          ),
        ]),

        Row(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15),
            )
          ],
        ),

        Row(children: [
          Expanded(
            flex: 12,
            child: Text('Total Equity',
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.black45,
                )),
          ),
          Expanded(
            flex: 12,
            child: Text('Invested',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSize, color: Colors.black45)),
          ),
          Expanded(
            flex: 12,
            child: Text('Profit',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.black45,
                )),
          ),
        ]),
        //second row value
        Row(children: [
          Expanded(
            flex: 12,
            child: Text(money.format(12345),
                style: TextStyle(
                    fontSize: fontSize,
                    color: baseColor,
                    fontWeight: baseWeight)),
          ),
          Expanded(
            flex: 12,
            child: Text(money.format(12345),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: fontSize,
                    color: baseColor,
                    fontWeight: baseWeight)),
          ),
          Expanded(
            flex: 12,
            child: Text(money.format(12345),
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: fontSize,
                    color: baseColor,
                    fontWeight: baseWeight)),
          ),
        ]),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
                flex: 12,
                child: Container(
                  padding: EdgeInsets.only(top: 15),
                  child: NeumorphicButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Settlement()));
                      },
                      style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20)),
                          color: Colors.blueAccent[200],
                          depth: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.list,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(' Settlement',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: baseWeight,
                                  fontSize: fontSize)),
                        ],
                      )),
                )),
            Expanded(
              child: Container(),
              flex: 1,
            ),
            Expanded(
                flex: 12,
                child: Container(
                  padding: EdgeInsets.only(top: 15),
                  child: NeumorphicButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profile()));
                      },
                      style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20)),
                          color: Colors.redAccent[200],
                          depth: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(' Profile',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: baseWeight,
                                  fontSize: fontSize)),
                        ],
                      )),
                )),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10),
        )
      ],
    );
  }

  Widget bottom() {
    return Container(
        padding: EdgeInsets.only(top: 5),
        width: MediaQuery.maybeOf(context).size.width,
        height: MediaQuery.maybeOf(context).size.height * 0.72,
        child: DefaultTabController(
            length: 3,
            initialIndex: widget.page == null ? 0 : widget.page,
            child: Scaffold(
              appBar: TabBar(
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.indigo,
                  unselectedLabelColor: Colors.black45,
                  tabs: <Widget>[
                    Container(
                      width: (MediaQuery.maybeOf(context).size.width - 120) / 3,
                      child: Tab(
                          child: Text('Portfolio',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w700))),
                    ),
                    Container(
                        width:
                            (MediaQuery.maybeOf(context).size.width - 120) / 3,
                        child: Tab(
                            child: Text('Order',
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontWeight: FontWeight.w700)))),
                    Container(
                        width:
                            (MediaQuery.maybeOf(context).size.width - 120) / 3,
                        child: Tab(
                            child: Text('Trade',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w700))))
                  ]),
              body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  portfolio(),
                  order(),
                  trade(),
                ],
              ),
            )));
  }

  Widget portfolio() {
    return Padding(
        padding: EdgeInsets.only(bottom: 0),
        child: Container(
            child: Column(
          children: [
            top(),
            Expanded(
                child: RefreshIndicator(
              onRefresh: () {},
              color: Colors.indigo,
              backgroundColor: Colors.indigo,
              child: ListView.builder(
                  itemCount: 40,
                  itemBuilder: (context, index) {
                    return portoCard();
                  }),
            ))
          ],
        )));
  }

  Widget order() {
    return Padding(
        padding: EdgeInsets.only(bottom: 0),
        child: Container(
            child: RefreshIndicator(
                color: Colors.indigo,
                backgroundColor: Colors.indigo,
                onRefresh: () {},
                child: ListView.builder(
                    itemCount: 40,
                    itemBuilder: (context, index) {
                      return orderCard();
                    }))));
  }

  Widget trade() {
    return Padding(
        padding: EdgeInsets.only(bottom: 0),
        child: Container(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return tradeCard();
              }),
        ));
  }

  Widget portoCard() {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
        child: NeumorphicButton(
          onPressed: () {},
          style: NeumorphicStyle(
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text('Stock',
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54))),
                  Expanded(
                      child: Text('Avg',
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54))),
                  Expanded(
                      child: Text('Lot',
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54))),
                  Expanded(
                      child: Text('Market Val.',
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54))),
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
                      child: Text('00,000',
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
                      child: Text('Invested',
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54))),
                  Expanded(
                      child: Text('Gain',
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text('00,000',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500))),
                  Expanded(
                      child: Text('+00,000 (00.00%)',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500))),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeumorphicButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BuySell(type: 'buy', code: 'ASSA')));
                  },
                  style: NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
                  child: NeumorphicIcon(
                    Icons.add,
                    style: NeumorphicStyle(color: Colors.green),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                Text(
                  'Buy',
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500),
                )
              ],
            )),
      ],
      secondaryActions: <Widget>[
        Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeumorphicButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BuySell(type: 'sell', code: 'ASSA')));
                  },
                  style: NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
                  child: NeumorphicIcon(
                    Icons.remove,
                    style: NeumorphicStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                Text(
                  'Sell',
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500),
                )
              ],
            )),
        // IconSlideAction(
        //   caption: 'More',
        //   color: Colors.black45,
        //   icon: Icons.more_horiz,
        //   onTap: () {},
        // ),
        // IconSlideAction(
        //   caption: 'Delete',
        //   color: Colors.red,
        //   icon: Icons.delete,
        //   onTap: () {},
        // ),
      ],
    );
  }

  Widget tradeCard() {
    return Container(
      padding: EdgeInsets.only(top: 7.5, bottom: 5, left: 10, right: 10),
      child: NeumorphicButton(
        onPressed: () {},
        style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text('Type',
                        style: TextStyle(fontSize: 12, color: Colors.black54))),
                Expanded(
                    child: Text('Stock',
                        style: TextStyle(fontSize: 12, color: Colors.black54))),
                Expanded(
                    child: Text('Lot',
                        style: TextStyle(fontSize: 12, color: Colors.black54))),
                Expanded(
                    child: Text('Price',
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
                    child: Text('00,000',
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

  Widget orderCard() {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        padding: EdgeInsets.only(top: 7.5, bottom: 5, left: 10, right: 10),
        child: NeumorphicButton(
          style: NeumorphicStyle(
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
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
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54))),
                  Expanded(
                      child: Text('Lot',
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54))),
                  Expanded(
                      child: Text('Done',
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54))),
                  Expanded(
                      child: Text('Price',
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54))),
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
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54))),
                  Expanded(
                      child: Text('Status',
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54))),
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
      ),
      actions: <Widget>[
        // IconSlideAction(
        //   caption: 'Archive',
        //   color: Colors.blue,
        //   icon: Icons.archive,
        //   onTap: () {},
        // ),
        Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeumorphicButton(
                  onPressed: _amendOrder,
                  style: NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
                  child: NeumorphicIcon(
                    Icons.change_history,
                    style: NeumorphicStyle(color: Colors.orange),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                Text(
                  'Amend',
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500),
                )
              ],
            )),
        // IconSlideAction(
        //   caption: 'Share',
        //   color: Colors.indigo,
        //   icon: Icons.share,
        //   onTap: () {},
        // ),
      ],
      secondaryActions: <Widget>[
        Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeumorphicButton(
                  onPressed: _confirmWithdraw,
                  style: NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
                  child: NeumorphicIcon(
                    Icons.cancel,
                    style: NeumorphicStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                Text(
                  'Withdraw',
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500),
                )
              ],
            )),
        // IconSlideAction(
        //   caption: 'More',
        //   color: Colors.black45,
        //   icon: Icons.more_horiz,
        //   onTap: () {},
        // ),
        // IconSlideAction(
        //   caption: 'Delete',
        //   color: Colors.red,
        //   icon: Icons.delete,
        //   onTap: () {},
        // ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: RefreshIndicator(
            child: ListView(
              children: <Widget>[bottom()],
            ),
            onRefresh: () {
              print('refreshed');
            }));
  }

  Future<void> _amendOrder() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
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
          title: Text('#000000000 - Amend Order'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
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
                            color: Colors.black54, fontWeight: FontWeight.w500),
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
                          controller: priceTextController,
                          cursorColor: Colors.indigo,
                          initialValue: '30000',
                          style: TextStyle(height: 0.8, color: Colors.black45),
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
                          style: TextStyle(height: 0.8, color: Colors.black45),
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
              ],
            ),
          ),
          actions: <Widget>[
            NeumorphicButton(
              style: NeumorphicStyle(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
              onPressed: () {},
              child: Text(
                'Amend',
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
            ),
            NeumorphicButton(
              style: NeumorphicStyle(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _confirmWithdraw() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
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
          title: Text('#000000000 - Order Buy'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to withdraw this order?'),
              ],
            ),
          ),
          actions: <Widget>[
            NeumorphicButton(
              style: NeumorphicStyle(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
              onPressed: () {},
              child: Text(
                'Withdraw',
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
            ),
            NeumorphicButton(
              style: NeumorphicStyle(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        );
      },
    );
  }
}
