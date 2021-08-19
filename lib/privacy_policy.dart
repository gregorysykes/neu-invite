import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'stock_card.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  TextStyle headerStyle = TextStyle(fontWeight: FontWeight.w800);
  TextStyle subStyle =
      TextStyle(fontWeight: FontWeight.w700, fontStyle: FontStyle.italic);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: NeumorphicAppBar(
              title: NeumorphicText(
                'Privacy Policy',
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
              RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(text: 'This is Header', style: headerStyle),
                      TextSpan(text: '\nThis is SubHeader', style: subStyle),
                      TextSpan(text: '\nThis is the Paragraph')
                    ]),
              )
            ],
          ),
        ));
  }
}
