import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class BrokerList extends StatefulWidget {
  @override
  _BrokerListState createState() => _BrokerListState();
}

class _BrokerListState extends State<BrokerList> {
  Map<String, dynamic> list;
  var isLoading = false;
  // IO.Socket socket = IO.io('http://10.0.2.2:3000', <String, dynamic>{
  IO.Socket socket = IO.io('http://localhost:3000', <String, dynamic>{
    'transports': ['websocket'],
    'forceNew': true
  });

  var money = NumberFormat('#,##0', 'en_US');
  var compact = NumberFormat.compact();

  var primary = TextStyle(fontSize: 15.0);

  var secondary = TextStyle(color: Colors.grey);

  _fetchData() async {
    socket.on('connect', (_) {
      socket.on('tradeData', (jsonData) {
        setState(() {
          // list.addAll(jsonData);
          // print(jsonData);
          // isLoading = false;
        });
      });
    });
  }

  @override
  initState() {
    super.initState();
    _fetchData();
  }

  @override
  dispose() {
    print('bye');
    // super.dispose();
    socket.emit('disconnect');
  }

  Widget tradeLine({String code, String name, int volume, int freq}) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              code,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 8,
            child: Text(
              name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade,
              softWrap: false,
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              compact.format(volume),
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              compact.format(freq),
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: NeumorphicAppBar(
            title: NeumorphicText(
              'Broker List',
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
          padding: EdgeInsets.all(15.0),
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Code',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Text(
                            'Broker Name',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Volume',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Freq',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 5, top: 5),
                      child: Neumorphic(
                        style: NeumorphicStyle(depth: -10),
                        padding: EdgeInsets.only(bottom: 5),
                        child: Container(),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 120,
                          itemBuilder: (context, index) {
                            return tradeLine(
                                code: 'IN',
                                name: 'Investindo Nusantara Sekuritas',
                                volume: 1328544858,
                                freq: 889889332);
                            // return tradeLine(
                            //     code: list[index].code,
                            //     lot: list[index].qty,
                            //     price: list[index].price);
                          }),
                    )
                  ],
                )),
    );
  }
}
