import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:money/invite_icons.dart';
import 'dart:async';
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class WithdrawDeposit extends StatefulWidget {
  @override
  _WithdrawDepositState createState() => _WithdrawDepositState();
}

class _WithdrawDepositState extends State<WithdrawDeposit> {
  TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    Widget deposit() {
      return Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                height: 220,
                child: Neumorphic(
                  style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(15))),
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Bank',
                            style:
                                TextStyle(color: Colors.black45, fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Bank Central Asia',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Row(
                            //   children: [
                            //     NeumorphicIcon(
                            //       Invite.chip,
                            //       size: 50,
                            //       style: NeumorphicStyle(
                            //           color: Colors.yellow[800], depth: 2),
                            //     )
                            //   ],
                            // ),
                            Row(
                              children: [
                                Text(
                                  'RDN Account',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '6041340662',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text('Holder\'s Name',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 12)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Gregory Sykes',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ));
    }

    Widget withdraw() {
      return Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                height: 220,
                child: Neumorphic(
                  style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(15))),
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Bank Central Asia',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                NeumorphicIcon(
                                  Invite.chip,
                                  size: 50,
                                  style: NeumorphicStyle(
                                      color: Colors.yellow[800], depth: 2),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Bank Account',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '6041340662',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text('Holder\'s Name',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 12)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Gregory Sykes',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Available Amount',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500)),
                        Expanded(
                          child: Text('Total Amount',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500)),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Row(
                      children: [
                        Text('Withdraw Amount',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500)),
                        Expanded(
                          child: Container(
                              // width: MediaQuery.maybeOf(context).size.width / 4,
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                    depth: -10,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(20))),
                                child: TextField(
                                  controller: textController,
                                  cursorColor: Colors.indigo,
                                  style: TextStyle(
                                      height: 0.9, color: Colors.black45),
                                  decoration: InputDecoration(
                                      labelStyle: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                      border: InputBorder.none,
                                      labelText: 'Withdraw Amount',
                                      prefixIcon: Icon(
                                        Icons.credit_card,
                                        size: 18,
                                        color: Colors.indigo,
                                      )),
                                ),
                              )),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Container(
                      width: MediaQuery.maybeOf(context).size.width,
                      child: NeumorphicButton(
                        onPressed: () {},
                        child: Text(
                          'Withdraw',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        style: NeumorphicStyle(
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(20))),
                      ),
                    )
                  ],
                ),
              )
            ],
          ));
    }

    return Scaffold(
      appBar: PreferredSize(
          child: NeumorphicAppBar(
            title: NeumorphicText(
              'Withdraw/Deposit',
              style: NeumorphicStyle(
                depth: 5,
                color: Colors.black45,
              ),
              textStyle: NeumorphicTextStyle(
                  fontSize: 13, fontWeight: FontWeight.bold),
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
          padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Container(
              child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: TabBar(
                        indicatorColor: Colors.transparent,
                        labelColor: Colors.indigo,
                        unselectedLabelColor: Colors.black45,
                        tabs: <Widget>[
                          Container(
                            width:
                                (MediaQuery.maybeOf(context).size.width - 120) /
                                    2,
                            child: Tab(
                                child: Text('Withdraw',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700))),
                          ),
                          Container(
                              width: (MediaQuery.maybeOf(context).size.width -
                                      120) /
                                  2,
                              child: Tab(
                                  child: Text('Deposit',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700)))),
                        ]),
                    body: TabBarView(
                      children: <Widget>[withdraw(), deposit()],
                    ),
                  )))),
    );
  }
}
