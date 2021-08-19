import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';

class Settlement extends StatefulWidget {
  @override
  _SettlementState createState() => _SettlementState();
}

class _SettlementState extends State<Settlement> {
  var money = NumberFormat('#,##0', 'en_US');

  Widget clientInfo(
      {int cash_margin = 0,
      int stock_margin = 0,
      int loan_rate = 0,
      int f_sell_rate = 0,
      int max_limit = 0,
      int credit_limit = 0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Client Info',
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
        ),
        Neumorphic(
          style: NeumorphicStyle(
              depth: -10,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Cash Margin',
                    style: TextStyle(
                        color: Colors.black45, fontStyle: FontStyle.italic),
                  ),
                  Expanded(
                      child: Text('Stock Margin',
                          style: TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.end))
                ],
              ),
              Row(
                children: [
                  Text(
                    money.format(cash_margin),
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: Text(
                    money.format(stock_margin),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Row(
                children: [
                  Text(
                    'Loan Rate',
                    style: TextStyle(
                        color: Colors.black45, fontStyle: FontStyle.italic),
                  ),
                  Expanded(
                      child: Text('Forced Sell Rate',
                          style: TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.end))
                ],
              ),
              Row(
                children: [
                  Text(
                    money.format(loan_rate),
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: Text(money.format(f_sell_rate),
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.end))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Row(
                children: [
                  Text(
                    'Max Limit',
                    style: TextStyle(
                        color: Colors.black45, fontStyle: FontStyle.italic),
                  ),
                  Expanded(
                      child: Text('Credit Limit',
                          style: TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.end))
                ],
              ),
              Row(
                children: [
                  Text(
                    money.format(max_limit),
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: Text(money.format(credit_limit),
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.end))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget clientCash(
      {int cash = 0,
      int net_cash = 0,
      int trading_limit = 0,
      int unrealized = 0,
      int f_sell = 0,
      int ratio = 0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Client Cash',
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
        ),
        Neumorphic(
          style: NeumorphicStyle(
              depth: -10,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Cash',
                    style: TextStyle(
                        color: Colors.black45, fontStyle: FontStyle.italic),
                  ),
                  Expanded(
                      child: Text('Nett Cash',
                          style: TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.end))
                ],
              ),
              Row(
                children: [
                  Text(
                    money.format(cash),
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: Text(
                    money.format(net_cash),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Row(
                children: [
                  Text(
                    'Trading Limit',
                    style: TextStyle(
                        color: Colors.black45, fontStyle: FontStyle.italic),
                  ),
                  Expanded(
                      child: Text('Unrealized',
                          style: TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.end))
                ],
              ),
              Row(
                children: [
                  Text(
                    money.format(trading_limit),
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: Text(money.format(unrealized),
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.end))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Row(
                children: [
                  Text(
                    'Forced Sell',
                    style: TextStyle(
                        color: Colors.black45, fontStyle: FontStyle.italic),
                  ),
                  Expanded(
                      child: Text('Ratio',
                          style: TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.end))
                ],
              ),
              Row(
                children: [
                  Text(
                    money.format(f_sell),
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: Text(money.format(ratio),
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.end))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget cashTable(
      {int t0p = 0,
      int t0m = 0,
      int t1p = 0,
      int t1m = 0,
      int t2p = 0,
      int t2m = 0}) {
    return Container(
      child: Neumorphic(
        style: NeumorphicStyle(
            depth: -10,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  child: Text(
                    'T+0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Text(
                    'T+1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Text(
                    'T+2',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5, top: 5),
              child: Neumorphic(
                padding: EdgeInsets.only(top: 2),
                child: Container(),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  '+',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w500),
                )),
                Expanded(
                  child: Text(
                    money.format(t0p),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Text(
                    money.format(t1p),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Text(
                    money.format(t2p),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '-',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Text(
                    money.format(t0m),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Text(
                    money.format(t1m),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Text(
                    money.format(t2m),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5, top: 5),
              child: Neumorphic(
                padding: EdgeInsets.only(top: 2),
                child: Container(),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Total',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Text(
                    money.format(t0m + t0p),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Text(
                    money.format(t1m + t1p),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Text(
                    money.format(t2m + t2p),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
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
                'Settlement',
                style: NeumorphicStyle(
                  depth: 5,
                  color: Colors.indigo,
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
              actions: [],
            ),
            preferredSize: Size.fromHeight(80.0)),
        body: Container(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              clientInfo(),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              clientCash(),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              cashTable()
            ],
          ),
        ));
  }
}
