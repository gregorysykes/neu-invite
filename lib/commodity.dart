import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Commodity extends StatefulWidget {
  @override
  _CommodityState createState() => _CommodityState();
}

class _CommodityState extends State<Commodity> {
  var percentage = NumberFormat.decimalPercentPattern(decimalDigits: 2);
  var money = NumberFormat('#,##0', 'en_US');
  Widget commodity({var index, var indexName, var price, var change}) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Neumorphic(
        style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Commodity',
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w500),
                ),
                Expanded(
                  child: Text(
                    'Price',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  'Commodity',
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w500),
                ),
                Expanded(
                  child: Text(
                    'Change',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
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
                'Commodity',
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
                      return commodity();
                    },
                    itemCount: 15,
                  ),
                ),
                onRefresh: () {})));
  }
}
