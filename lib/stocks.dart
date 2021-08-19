import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:money/buy_sell.dart';
import 'stock_card.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Stocks extends StatefulWidget {
  @override
  _StocksState createState() => _StocksState();
}

class _StocksState extends State<Stocks> with AutomaticKeepAliveClientMixin {
  Map<String, dynamic> list;
  int length = 0;
  Map<String, dynamic> data;
  List<dynamic> stock_list;
  var isLoading = true;

  var filters = [
    ['LQ45', false],
    ['Watchlist', false],
    ['Acceleration', false],
    ['IDX Watchlist', false],
    ['Special Noatations', false]
  ];

  TextEditingController textController;
  // IO.Socket socket = IO.io('http://10.0.2.2:3000', <String, dynamic>{
  IO.Socket socket = IO.io('http://localhost:3000', <String, dynamic>{
    'transports': ['websocket'],
    'forceNew': true
  });

  _fetchData() async {
    socket.emit('stockPrice', '*');
    socket.on('connect', (_) {
      socket.on('stockQuote', (jsonData) {
        setState(() {
          list = jsonData;
          length = list.length;
          isLoading = false;
        });
      });
    });

    // final resp = await http.get('http://10.0.2.2:8000/api/listStock');
    final resp = await http.get('http://localhost:8000/api/listStock');
    if (resp.statusCode == 200) {
      stock_list = jsonDecode(resp.body.toString());
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to get Stock list');
    }
  }

  @override
  initState() {
    _fetchData();
    super.initState();
  }

  @override
  dispose() {
    print('bye');
    socket.emit('disconnect');
    super.dispose();
  }

  Future<void> _filters() async {
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
              children: <Widget>[
                Text(
                  'Filters',
                  style: TextStyle(color: Colors.indigo),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Container(
                  height: MediaQuery.maybeOf(context).size.height / 3.5,
                  width: MediaQuery.maybeOf(context).size.width,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.fromLTRB(10, 7.5, 10, 7.5),
                          child: Container(
                            width: MediaQuery.maybeOf(context).size.width,
                            child: NeumorphicButton(
                              style: NeumorphicStyle(
                                  depth: filters[index][1] ? -5 : 5,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(20))),
                              child: Text(
                                filters[index][0],
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500),
                              ),
                              onPressed: () {
                                setState(() {
                                  filters[index][1] = !filters[index][1];
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          ));
                    },
                    itemCount: 5,
                  ),
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Sort';
    return Scaffold(
      body: Container(
          // padding: EdgeInsets.all(15.0),
          height: MediaQuery.maybeOf(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        depth: -10,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    child: TextField(
                      controller: textController,
                      cursorColor: Colors.indigo,
                      style: TextStyle(height: 0.9, color: Colors.black45),
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                          border: InputBorder.none,
                          labelText: 'Search Stock',
                          prefixIcon: Icon(
                            Icons.search,
                            size: 18,
                            color: Colors.indigo,
                          )),
                    ),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
                  child: Row(
                    children: [
                      Container(
                          width: MediaQuery.maybeOf(context).size.width / 3,
                          child: NeumorphicButton(
                            onPressed: _filters,
                            padding: EdgeInsets.all(13.6),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.filter_alt,
                                  size: 15,
                                  color: Colors.black54,
                                ),
                                Text(' Filter',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500))
                              ],
                            ),
                            style: NeumorphicStyle(
                                depth: 5,
                                color: Colors.grey[350],
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(20))),
                          )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Neumorphic(
                            padding: EdgeInsets.all(10),
                            style: NeumorphicStyle(
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(20))),
                            child: DropdownButtonFormField<String>(
                              value: dropdownValue,
                              decoration:
                                  InputDecoration.collapsed(hintText: ''),
                              dropdownColor: Colors.grey[350],
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                              icon: Icon(Icons.sort),
                              iconSize: 18,
                              elevation: 2,
                              iconEnabledColor: Colors.black54,
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>[
                                'Sort',
                                'Volume Ascending',
                                'Volume Descending',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 13,
                                      )),
                                );
                              }).toList(),
                            )),
                      ))
                    ],
                  )),
              // Expanded(
              //     child: isLoading
              //         ? Center(child: CircularProgressIndicator())
              //         : ListView.builder(
              //             itemCount: length,
              //             itemBuilder: (context, index) {
              //               return StockCard(
              //                 stock_code: list[stock_list[index]['code']]['code'],
              //                 stock_name: list[stock_list[index]['code']]['name'],
              //                 stock_price: list[stock_list[index]['code']]['price'],
              //                 change: list[stock_list[index]['code']]['change'],
              //               );
              //             }))
              Expanded(
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          child: StockCard(
                            stock_code: 'BBCA',
                            stock_name: 'Bank Central Asia',
                            stock_price: 31000,
                            change: -800,
                          ),
                          actions: <Widget>[
                            Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    NeumorphicButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => BuySell(
                                                      type: 'buy',
                                                      code: 'BBCA',
                                                    )));
                                      },
                                      style: NeumorphicStyle(
                                          boxShape:
                                              NeumorphicBoxShape.circle()),
                                      child: NeumorphicIcon(
                                        Icons.add,
                                        style: NeumorphicStyle(
                                            color: Colors.green),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                    ),
                                    Text(
                                      'Buy',
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )),
                          ],
                          secondaryActions: <Widget>[
                            Container(
                                padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    NeumorphicButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => BuySell(
                                                    type: 'sell',
                                                    code: 'BBCA')));
                                      },
                                      style: NeumorphicStyle(
                                          boxShape:
                                              NeumorphicBoxShape.circle()),
                                      child: NeumorphicIcon(
                                        Icons.remove,
                                        style:
                                            NeumorphicStyle(color: Colors.red),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                    ),
                                    Text(
                                      'Sell',
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )),
                          ],
                        );
                      }))
            ],
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
