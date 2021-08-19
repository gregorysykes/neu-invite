import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Feeds extends StatefulWidget {
  @override
  _FeedsState createState() => _FeedsState();
}

TextEditingController textController;
Map<String, dynamic> list;
var isLoading = false;

class _FeedsState extends State<Feeds> {
  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(
        "https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=61ae7bd3db18402493d9132fad89bd36");
    if (response.statusCode == 200) {
      list = jsonDecode(response.body.toString());
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  initState() {
    _fetchData();
    super.initState();
  }

  Widget post(String username, String post, String profilePic) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
        child: Neumorphic(
            padding: EdgeInsets.all(18),
            style: NeumorphicStyle(
                color: Colors.grey[350],
                depth: 10,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Neumorphic(
                  style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.circle(),
                      depth: 10,
                      border:
                          NeumorphicBorder(color: Colors.grey[350], width: 2)),
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                      fit: BoxFit.cover,
                      alignment: FractionalOffset.topCenter,
                      image: new NetworkImage(profilePic),
                    )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.maybeOf(context).size.width * .6,
                      child: Text(
                        username,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      width: MediaQuery.maybeOf(context).size.width * .6,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        post,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 8,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  Widget posts() {
    return Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Neumorphic(
          style: NeumorphicStyle(
              color: Colors.grey[350],
              depth: -10,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
          child: isLoading
              ? Center(
                  child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: NeumorphicProgressIndeterminate(
                        style: ProgressStyle(accent: Colors.indigo),
                      )))
              : ListView.builder(
                  itemCount: list.length * 5,
                  itemBuilder: (context, index) {
                    return post('User', list['articles'][index]['description'],
                        list['articles'][index]['urlToImage']);
                  },
                ),
        ));
  }

  Widget postBar() {
    return Padding(
        padding: EdgeInsets.all(0),
        child: Container(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Neumorphic(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      style: NeumorphicStyle(
                          depth: -10,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20))),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          style: TextStyle(height: 0.9, color: Colors.black54),
                          decoration: InputDecoration.collapsed(
                            hintText: 'Post your thoughts',
                          ),
                          autocorrect: false,
                          controller: textController,
                        ),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                NeumorphicButton(
                  style: NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
                  child: NeumorphicIcon(
                    Icons.send,
                    style: NeumorphicStyle(color: Colors.indigo),
                  ),
                  onPressed: () {},
                ),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [Expanded(child: posts()), postBar()],
    ));
  }
}
