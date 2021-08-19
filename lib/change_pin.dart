import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ChangePin extends StatefulWidget {
  @override
  _ChangePinState createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  TextEditingController pinController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: NeumorphicAppBar(
              title: NeumorphicText(
                'Change PIN',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: Neumorphic(
                          style: NeumorphicStyle(
                              depth: -15,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(20))),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: pinController,
                            cursorColor: Colors.indigo,
                            style:
                                TextStyle(height: 0.9, color: Colors.black45),
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                                border: InputBorder.none,
                                labelText: 'Enter Current PIN',
                                prefixIcon: Icon(
                                  Icons.dialpad,
                                  size: 18,
                                  color: Colors.indigo,
                                )),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: Neumorphic(
                          style: NeumorphicStyle(
                              depth: -15,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(20))),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: pinController,
                            cursorColor: Colors.indigo,
                            style:
                                TextStyle(height: 0.9, color: Colors.black45),
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                                border: InputBorder.none,
                                labelText: 'Enter New PIN',
                                prefixIcon: Icon(
                                  Icons.dialpad,
                                  size: 18,
                                  color: Colors.indigo,
                                )),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: Neumorphic(
                          style: NeumorphicStyle(
                              depth: -15,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(20))),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: pinController,
                            cursorColor: Colors.indigo,
                            style:
                                TextStyle(height: 0.9, color: Colors.black45),
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                                border: InputBorder.none,
                                labelText: 'Confirm New PIN',
                                prefixIcon: Icon(
                                  Icons.dialpad,
                                  size: 18,
                                  color: Colors.indigo,
                                )),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      width: MediaQuery.maybeOf(context).size.width,
                      child: NeumorphicButton(
                        onPressed: () {},
                        padding: EdgeInsets.all(12),
                        child: Text('Save Changes',
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                            textAlign: TextAlign.center),
                        style: NeumorphicStyle(
                            depth: 5,
                            color: Colors.indigo,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(20))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
