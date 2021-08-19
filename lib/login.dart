import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:money/invite_icons.dart';
import 'package:money/pin.dart';
import 'package:url_launcher/url_launcher.dart';
import 'register.dart';
import 'main.dart';
// import '../lib/invite_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Login extends StatelessWidget {
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
      home: LoginBuilder(),
    );
  }
}

class LoginBuilder extends StatefulWidget {
  @override
  _LoginBuilderState createState() => _LoginBuilderState();
}

class _LoginBuilderState extends State<LoginBuilder> {
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
                      padding: EdgeInsets.only(top: 10),
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
                                labelText: 'Username',
                                prefixIcon: Icon(
                                  Icons.person,
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
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Neumorphic(
                          style: NeumorphicStyle(
                              depth: -15,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(20))),
                          child: TextField(
                            obscureText: _obscureText,
                            controller: passwordController,
                            cursorColor: Colors.indigo,
                            style:
                                TextStyle(height: 0.9, color: Colors.black45),
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                                border: InputBorder.none,
                                labelText: 'Password',
                                suffixIcon: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        _obscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.indigo,
                                        size: 18,
                                      ),
                                      onPressed: _toggle,
                                    )
                                  ],
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 18,
                                  color: Colors.indigo,
                                )),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Container(
                        width: MediaQuery.maybeOf(context).size.width,
                        child: Row(
                          children: [
                            NeumorphicSwitch(
                              height: 30,
                              value: _checkedValue,
                              style: NeumorphicSwitchStyle(
                                  lightSource: LightSource.topLeft,
                                  activeTrackColor: Colors.indigo,
                                  inactiveThumbColor: Colors.indigo,
                                  trackDepth: 20),
                              onChanged: (bool newValue) {
                                print('Remember Me: ' + newValue.toString());
                                setState(() {
                                  _checkedValue = newValue;
                                });
                              },
                            ),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              'Remember Me',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54),
                            ),
                            Expanded(
                                child: RichText(
                              textAlign: TextAlign.end,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Forgot Password',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print('Forgot Password');
                                      },
                                    style: TextStyle(
                                      color: Colors.indigo,
                                    ))
                              ]),
                            ))
                          ],
                        )),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      width: MediaQuery.maybeOf(context).size.width,
                      child: NeumorphicButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Pin()),
                            (route) => false,
                          );
                        },
                        padding: EdgeInsets.all(12),
                        child: Text('Login',
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: TextStyle(
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
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      width: MediaQuery.maybeOf(context).size.width,
                      child: NeumorphicButton(
                        onPressed: () {
                          launch('https://google.com');
                        },
                        padding: EdgeInsets.all(12),
                        child: Text('Register',
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                            textAlign: TextAlign.center),
                        style: NeumorphicStyle(
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
