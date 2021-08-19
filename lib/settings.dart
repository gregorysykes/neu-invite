import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:money/change_password.dart';
import 'package:money/change_pin.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var notificationState = true;
  var requirePin = true;

  //about the company
  Future<void> _aboutTheCompany() async {
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
              children: <Widget>[Text('About')],
            ),
          ),
        );
      },
    );
  }

  //neu
  Future<void> _neumorphism() async {
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
              children: <Widget>[Text('Neumorphism')],
            ),
          ),
        );
      },
    );
  }

  //the developer
  Future<void> _developer() async {
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
              children: <Widget>[Text('Developer')],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: NeumorphicAppBar(
              title: NeumorphicText(
                'Settings',
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
              Text(
                'Notification',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              NeumorphicButton(
                onPressed: () {
                  setState(() {
                    notificationState = !notificationState;
                  });
                },
                style: NeumorphicStyle(
                    depth: notificationState ? -5 : 5,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(20))),
                child: Row(
                  children: [
                    Text(
                      'Notification',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(0),
                      ),
                    ),
                    Neumorphic(
                        style: NeumorphicStyle(
                            depth: notificationState ? 5 : -10,
                            color:
                                notificationState ? Colors.green : Colors.red),
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          notificationState
                              ? Icons.notifications_on
                              : Icons.notifications_off,
                          color: Colors.grey[350],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Text(
                'Password & PIN',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              NeumorphicButton(
                onPressed: () {
                  setState(() {
                    requirePin = !requirePin;
                  });
                },
                style: NeumorphicStyle(
                    depth: requirePin ? -5 : 5,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(20))),
                child: Row(
                  children: [
                    Text(
                      'PIN',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(0),
                      ),
                    ),
                    Neumorphic(
                        style: NeumorphicStyle(
                            depth: requirePin ? 5 : -10,
                            color: requirePin ? Colors.green : Colors.red),
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.dialpad,
                          color: Colors.grey[350],
                          // size: 20,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              NeumorphicButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChangePin()),
                  );
                },
                style: NeumorphicStyle(
                    depth: 5,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(20))),
                child: Row(
                  children: [
                    Text(
                      'Change PIN',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(0),
                      ),
                    ),
                    Neumorphic(
                        style: NeumorphicStyle(depth: -10),
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.dialpad,
                          color: Colors.indigo,
                          // size: 20,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              NeumorphicButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChangePassword()),
                  );
                },
                style: NeumorphicStyle(
                    depth: 5,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(20))),
                child: Row(
                  children: [
                    Text(
                      'Change Password',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(0),
                      ),
                    ),
                    Neumorphic(
                        style: NeumorphicStyle(depth: -10),
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.lock,
                          color: Colors.indigo,
                          // size: 20,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Text(
                'Extra',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              NeumorphicButton(
                onPressed: () {
                  _aboutTheCompany();
                },
                style: NeumorphicStyle(
                    depth: 5,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(20))),
                child: Row(
                  children: [
                    Text(
                      'About the Company',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(0),
                      ),
                    ),
                    Neumorphic(
                        style: NeumorphicStyle(depth: -10),
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.business, color: Colors.indigo,
                          // size: 20,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              NeumorphicButton(
                onPressed: () {
                  _neumorphism();
                },
                style: NeumorphicStyle(
                    depth: 5,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(20))),
                child: Row(
                  children: [
                    Text(
                      'Neumorphism',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(0),
                      ),
                    ),
                    Neumorphic(
                        style: NeumorphicStyle(depth: -10),
                        padding: EdgeInsets.all(7.5),
                        child: NeumorphicIcon(Icons.circle)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              NeumorphicButton(
                onPressed: () {
                  _developer();
                },
                style: NeumorphicStyle(
                    depth: 5,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(20))),
                child: Row(
                  children: [
                    Text(
                      'Developer',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(0),
                      ),
                    ),
                    Neumorphic(
                        style: NeumorphicStyle(depth: -10),
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.code, color: Colors.indigo,
                          // size: 20,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
