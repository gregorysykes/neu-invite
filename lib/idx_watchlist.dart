import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'stock_card.dart';

class IdxWatchlist extends StatefulWidget {
  @override
  _IdxWatchlistState createState() => _IdxWatchlistState();
}

class _IdxWatchlistState extends State<IdxWatchlist> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: NeumorphicAppBar(
            title: NeumorphicText(
              'IDX Watchlist',
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
                      return StockCard(
                        stock_code: 'BBCA',
                        stock_name: 'Bank Central Asia',
                        stock_price: 31000,
                        change: -800,
                      );
                    },
                    itemCount: 30,
                  ),
                  onRefresh: () {
                    print('refreshed');
                  })),
    );
  }
}
