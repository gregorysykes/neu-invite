import 'package:flutter/material.dart';
import 'package:money/broker_list.dart';
import 'package:money/buy_sell.dart';
import 'package:money/idx_watchlist.dart';
import 'package:money/live_trade.dart';
import 'package:money/privacy_policy.dart';
import 'package:money/profile.dart';
import 'package:money/reminders.dart';
import 'package:money/settings.dart';
import 'package:money/settlement.dart';
import 'package:money/special_notations.dart';
import 'package:money/withdraw_deposit.dart';
import 'home.dart';
import 'lounge.dart';
import 'stocks.dart';
import 'portfolio.dart';
import 'login.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:money/invite_icons.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Login());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  int customIndex = 0;
  int customSubIndex = 0;
  MyApp({this.customIndex, this.customSubIndex});
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'invite',
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
      home: MyHomePage(
        customIndex: this.customIndex == 0 ? 0 : this.customIndex,
        customSubIndex: this.customSubIndex == 0 ? 0 : this.customSubIndex,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
  int customIndex = 0;
  int customSubIndex = 0;
  MyHomePage({this.customIndex, this.customSubIndex});
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int _subIndex = 0;
  // final List<Widget> _widgetOptions = [];

  @override
  void initState() {
    _subIndex = widget.customSubIndex;
  }

  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    Lounge(),
    Stocks(),
    Portfolio(),
    Lounge(page: 1),
    Portfolio(page: 1),
    Portfolio(page: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: NeumorphicAppBar(
              title: NeumorphicIcon(
                Invite.final_rounded,
                size: 60,
                style: NeumorphicStyle(color: Colors.indigo),
              ),
              centerTitle: true,
              buttonStyle: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 5,
                  color: Colors.grey[350]),
              iconTheme: IconThemeData(color: Colors.black45, size: 18),
            ),
            preferredSize: Size.fromHeight(80.0)),
        drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors
                  .grey[350], //This will change the drawer background to blue.
              //other styles
            ),
            child: Drawer(
              elevation: 10,
              child: ListView(children: <Widget>[
                // Container(
                //   padding: EdgeInsets.all(10),
                //   child: NeumorphicButton(
                //       style: NeumorphicStyle(
                //           boxShape: NeumorphicBoxShape.circle()),
                //       onPressed: () {},
                //       padding: EdgeInsets.all(10),
                //       child: NeumorphicIcon(
                //         Icons.person,
                //         size: 50,
                //         style: NeumorphicStyle(color: Colors.indigo),
                //       )),
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text(
                    'Trade',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BuySell()));
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style:
                              NeumorphicStyle(depth: -10, color: Colors.indigo),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.sync,
                            style: NeumorphicStyle(color: Colors.grey[350]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text('Buy/Sell',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Reminders()));
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(
                              depth: -10, color: Colors.grey[350]),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.alarm,
                            style: NeumorphicStyle(color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text('Reminders',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text(
                    'Market Info',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LiveTrade()));
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(depth: -10, color: Colors.red),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.circle,
                            style: NeumorphicStyle(
                                depth: 2, color: Colors.grey[350]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text('Live Trade',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IdxWatchlist()));
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(depth: -10),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.watch_later,
                            style:
                                NeumorphicStyle(depth: 2, color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text('IDX Watchlist',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SpecialNotations()));
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(depth: -10),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.notification_important,
                            style:
                                NeumorphicStyle(depth: 2, color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text('Special Notations',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                //   child: NeumorphicButton(
                //     style: NeumorphicStyle(
                //         boxShape: NeumorphicBoxShape.roundRect(
                //             BorderRadius.circular(20))),
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => LiveTrade()));
                //     },
                //     padding: EdgeInsets.all(10),
                //     child: Row(
                //       children: [
                //         Neumorphic(
                //           style: NeumorphicStyle(depth: -10),
                //           padding: EdgeInsets.all(5),
                //           child: NeumorphicIcon(
                //             Icons.category,
                //             style: NeumorphicStyle(color: Colors.indigo),
                //           ),
                //         ),
                //         Padding(
                //           padding: EdgeInsets.only(left: 5),
                //         ),
                //         Text(
                //           'Categories',
                //           style: TextStyle(
                //               color: Colors.black54,
                //               fontSize: 13,
                //               fontWeight: FontWeight.w500),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BrokerList()));
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(depth: -10),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.storefront_rounded,
                            style: NeumorphicStyle(color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text(
                          'Broker List',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text(
                    'Portfolio',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyApp(customIndex: 3, customSubIndex: 2)),
                        (route) => false,
                      );
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(depth: -10),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.assignment,
                            style: NeumorphicStyle(color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text(
                          'Order List',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyApp(customIndex: 3, customSubIndex: 3)),
                        (route) => false,
                      );
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(depth: -10),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.point_of_sale,
                            style: NeumorphicStyle(color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text(
                          'Trade List',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyApp(customIndex: 3, customSubIndex: 0)),
                        (route) => false,
                      );
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(depth: -10),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.pie_chart,
                            style: NeumorphicStyle(color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text(
                          'Portfolio',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(depth: -10),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.person,
                            style: NeumorphicStyle(color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Settlement()));
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(depth: -10),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.list,
                            style: NeumorphicStyle(color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text(
                          'Settlement',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text(
                    'Feeds',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyApp(customIndex: 1, customSubIndex: 0)),
                        (route) => false,
                      );
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(depth: -10),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.chat,
                            style: NeumorphicStyle(color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text(
                          'Feeds',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyApp(customIndex: 1, customSubIndex: 3)),
                        (route) => false,
                      );
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(depth: -10),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.article,
                            style: NeumorphicStyle(color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text(
                          'News',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text(
                    'Others',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WithdrawDeposit()));
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(depth: -10),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.account_balance_wallet,
                            style: NeumorphicStyle(color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text(
                          'Withdraw/Deposit',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Settings()));
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(depth: -10),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.settings,
                            style: NeumorphicStyle(color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      const url = 'https://wa.me/628118385887';
                      launch(url);
                      // if (await canLaunch(url)) {
                      //   launch(url);
                      // } else {}
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(depth: -10),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.support_agent,
                            style: NeumorphicStyle(color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text(
                          'Customer Service',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrivacyPolicy()));
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(depth: -10),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.admin_panel_settings,
                            style: NeumorphicStyle(color: Colors.indigo),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text(
                          'Privacy & Policy',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    onPressed: () {
                      return showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: false,
                            contentTextStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                            titleTextStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700),
                            buttonPadding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            backgroundColor: Colors.grey[350],
                            actions: <Widget>[
                              NeumorphicButton(
                                style: NeumorphicStyle(
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(20))),
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                    (route) => false,
                                  );
                                },
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              NeumorphicButton(
                                style: NeumorphicStyle(
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(20))),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                            // title: Text('#IHSG'),
                            content: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Are You Sure You Want to Logout?',
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Neumorphic(
                          style:
                              NeumorphicStyle(depth: -10, color: Colors.green),
                          padding: EdgeInsets.all(5),
                          child: NeumorphicIcon(
                            Icons.exit_to_app,
                            style: NeumorphicStyle(color: Colors.grey[350]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                        ),
                        Text('Logout',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              ]),
            )),
        body: _widgetOptions.elementAt(widget.customIndex == null
            ? _selectedIndex
            : widget.customIndex + widget.customSubIndex),
        // body: _widgetOptions.elementAt(_indexCount(
        //     widget.customIndex, _selectedIndex, widget.customSubIndex)),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex:
              widget.customIndex == null ? _selectedIndex : widget.customIndex,
          onChange: (index) {
            setState(() {
              widget.customIndex = null;
              _selectedIndex = index;
            });
          },
          children: [
            CustomBottomNavigationItem(
              icon: Icons.home,
              label: 'Home',
            ),
            CustomBottomNavigationItem(
              icon: Icons.weekend,
              label: 'Feeds',
            ),
            CustomBottomNavigationItem(
              icon: Icons.show_chart,
              label: 'Stocks',
            ),
            CustomBottomNavigationItem(
                icon: Icons.pie_chart, label: 'Portfolio'),
          ],
        ));
  }
}

const Color PRIMARY_COLOR = Colors.indigo;
const Color BACKGROUND_COLOR = Color(0xdbdbdb);

class CustomBottomNavigationBar extends StatefulWidget {
  final Color backgroundColor;
  final Color itemColor;
  final List<CustomBottomNavigationItem> children;
  final Function(int) onChange;
  final int currentIndex;

  CustomBottomNavigationBar(
      {this.backgroundColor = BACKGROUND_COLOR,
      this.itemColor = PRIMARY_COLOR,
      this.currentIndex = 0,
      @required this.children,
      this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _changeIndex(int index) {
    if (widget.onChange != null) {
      widget.onChange(index);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.children.map((item) {
          // var color = widget.currentIndex == index ?;
          var icon = item.icon;
          var label = item.label;
          int index = widget.children.indexOf(item);
          return GestureDetector(
            onTap: () {
              _changeIndex(index);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(top: 0, bottom: 20),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Neumorphic(
                      style: NeumorphicStyle(
                          depth: widget.currentIndex == index ? -10 : 10,
                          color: Colors.grey[350],
                          lightSource: LightSource.topLeft,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20))),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: NeumorphicIcon(
                          icon,
                          size: 25,
                          style: NeumorphicStyle(
                              color: widget.currentIndex == index
                                  ? Colors.indigo
                                  : Colors.black45),
                        ),
                      )),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomBottomNavigationItem {
  final IconData icon;
  final String label;
  final Color color;

  CustomBottomNavigationItem(
      {@required this.icon, @required this.label, this.color});
}
