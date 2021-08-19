import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'stock_card.dart';

class SpecialNotations extends StatefulWidget {
  @override
  _SpecialNotationsState createState() => _SpecialNotationsState();
}

class _SpecialNotationsState extends State<SpecialNotations> {
  var isLoading = false;

  Widget card({String code, String name, String notation}) {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Neumorphic(
          style: NeumorphicStyle(
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(code,
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500)),
                  Text(name,
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500))
                ],
              ),
              Expanded(
                  child: Text(
                notation,
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
                textAlign: TextAlign.end,
              ))
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: NeumorphicAppBar(
            title: NeumorphicText(
              'Special Notations',
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
          // padding: EdgeInsets.all(15.0),
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  color: Colors.indigo,
                  backgroundColor: Colors.grey[350],
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return card(
                        code: 'BBCA',
                        name: 'Bank Central Asia',
                        notation: 'EL',
                      );
                    },
                    itemCount: 30,
                  ),
                  onRefresh: () {
                    print('refreshed');
                  })),
    );
  }
}
