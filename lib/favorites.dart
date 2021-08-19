import 'package:flutter/material.dart';
import 'stock_card.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  // String _valFriends;
  // List _myFriends = [
  //   "Watchlist 1",
  //   "Watchlist 2",
  //   "Watchlist 3",
  //   "Watchlist 4",
  //   "Watchlist 5",
  //   "Watchlist 6",
  //   "Watchlist 7",
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
          padding: EdgeInsets.all(15.0),
          height: MediaQuery.maybeOf(context).size.height,
          child: Column(
            children: <Widget>[
              // Container(
              //   width: MediaQuery.maybeOf(context).size.width,
              //   padding: EdgeInsets.only(top:5.0,bottom:15.0),
              //   child: Row(
              //     children: <Widget>[
              //       DropdownButton(
              //         value: _valFriends,
              //         items: _myFriends.map((value) {
              //           return DropdownMenuItem(
              //             child: Text(value),
              //             value: value,
              //           );
              //         }).toList(),
              //         onChanged: (value) {
              //           setState(() {
              //             _valFriends = value;
              //           });
              //         },
              //       ),

              //     ],
              //   )
              // ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    StockCard(
                      stock_code: 'BBCA',
                      stock_name: 'Bank Central Asia',
                      stock_price: 26500,
                      change: -1400,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
