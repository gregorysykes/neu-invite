import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'register.dart';
import 'main.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:money/invite_icons.dart';

class Pin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Colors.grey[350],
        lightSource: LightSource.topLeft,
        depth: 5,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      home: PinBuilder(),
    );
  }
}

class PinBuilder extends StatefulWidget {
  @override
  _PinBuilderState createState() => _PinBuilderState();
}

class _PinBuilderState extends State<PinBuilder> {
  bool _obscureText = true;
  bool _checkedValue = true;
  // String _password;

  TextEditingController usernameController;
  TextEditingController passwordController;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    NeumorphicIcon(
                      Invite.final_rounded,
                      size: 120,
                      style: NeumorphicStyle(color: Colors.indigo),
                    ),
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
                            controller: usernameController,
                            cursorColor: Colors.indigo,
                            style:
                                TextStyle(height: 0.9, color: Colors.black45),
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                                border: InputBorder.none,
                                labelText: 'PIN',
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
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                            (route) => false,
                          );
                        },
                        padding: EdgeInsets.all(12),
                        child: Text('Login',
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
          )),
    );
  }
}
