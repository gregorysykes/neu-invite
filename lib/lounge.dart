import 'package:flutter/material.dart';
import 'chats.dart';
import 'news.dart';
import 'feeds.dart';

class Lounge extends StatefulWidget {
  @override
  _LoungeState createState() => _LoungeState();
  int page = 0;
  Lounge({this.page});
}

class _LoungeState extends State<Lounge> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: DefaultTabController(
            length: 2,
            initialIndex: widget.page == null ? 0 : widget.page,
            child: Scaffold(
              appBar: TabBar(
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.indigo,
                  unselectedLabelColor: Colors.black45,
                  labelPadding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  tabs: <Widget>[
                    // Tab(icon:Icon(Icons.chat_bubble),text: 'Chats',),
                    Tab(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Icon(Icons.chat_bubble),
                        Text('Feeds')
                      ],
                    )),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Icon(Icons.chrome_reader_mode),
                          Text('News')
                        ],
                      ),
                    )
                  ]),
              body: TabBarView(
                children: <Widget>[Feeds(), News()],
              ),
            )));
  }
}
