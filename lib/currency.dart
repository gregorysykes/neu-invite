import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Currency extends StatefulWidget {
  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  var percentage = NumberFormat.decimalPercentPattern(decimalDigits: 2);
  var money = NumberFormat('#,##0', 'en_US');
  Widget currencyCard({var index, var indexName, var price, var change}) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Neumorphic(
        style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Text(
              'Currency',
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    'Change',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
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
                'Currency',
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
            padding: EdgeInsets.all(15),
            child: RefreshIndicator(
                color: Colors.indigo,
                backgroundColor: Colors.grey[350],
                child: Neumorphic(
                  style: NeumorphicStyle(
                      depth: -10,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(20))),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return currencyCard();
                    },
                    itemCount: 10,
                  ),
                ),
                onRefresh: () {})));
  }
}
