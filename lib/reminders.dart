import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'stock_card.dart';

class Reminders extends StatefulWidget {
  @override
  _RemindersState createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  var isLoading = false;
  var money = NumberFormat('#,##0', 'en_US');

  Widget card({String code, String name, String operation, int price}) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Neumorphic(
            style: NeumorphicStyle(
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
            padding: EdgeInsets.all(17.5),
            child: Row(
              children: [
                Text(code,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500)),
                Expanded(
                    child: Text(
                  operation,
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.end,
                )),
                Expanded(
                    child: Text(
                  money.format(price),
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.end,
                ))
              ],
            ),
          )),
      secondaryActions: <Widget>[
        Container(
            child: NeumorphicButton(
          onPressed: _confirmRemove,
          style: NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
          child: NeumorphicIcon(
            Icons.remove,
            style: NeumorphicStyle(color: Colors.red),
          ),
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: NeumorphicAppBar(
            title: NeumorphicText(
              'Reminders',
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
                        operation: '>',
                        price: 1000,
                      );
                    },
                    itemCount: 30,
                  ),
                  onRefresh: () {
                    print('refreshed');
                  })),
    );
  }

  Future<void> _confirmRemove() async {
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
          title: Text('Code > price'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Remove Reminder?'),
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
                'Remove',
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
