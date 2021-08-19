import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  Map<String, dynamic> list;
  var isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get("http://marketinfo.investindosekuritas.co.id:8899/news");
    if (response.statusCode == 200) {
      list = jsonDecode(response.body.toString());
      print(list);
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

  // dispose(){
  //   super.dispose();
  // }
  Widget newsCard(String title, String description, String tags) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: NeumorphicButton(
          child: Container(
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 13),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '#' + tags,
                            style: TextStyle(
                                color: Colors.blue[600],
                                fontSize: 12,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
          style: NeumorphicStyle(
              color: Colors.grey[350],
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
              depth: 10),
          onPressed: () {},
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      child: NeumorphicProgressIndeterminate()),
                )
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return newsCard(list[index]['title'], list[index]['news'],
                        list[index]['tags']);
                  },
                ),
        ));
  }
}
