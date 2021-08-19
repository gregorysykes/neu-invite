import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<Message> messages;
  double height, width;
  TextEditingController textController;
  ScrollController scrollController;
  IO.Socket socket =
      IO.io('https://investindo.herokuapp.com/', <String, dynamic>{
    'transports': ['websocket']
  });

  @override
  void initState() {
    messages = List<Message>();
    textController = TextEditingController();
    scrollController = ScrollController();
    Map<String, dynamic> data;

    socket.on('connect', (_) {
      socket.on('receive_message', (jsonData) {
        data = json.decode(jsonData);
        this.setState(
            () => messages.add(new Message(data['user_id'], data['message'])));
        scrollController.animateTo(
            scrollController.position.maxScrollExtent * 1.3,
            duration: Duration(milliseconds: 600),
            curve: Curves.ease);
      });
    });

    super.initState();
  }

  Widget buildSingleMessage(int index) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(bottom: 20.0, left: 20.0),
        decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          messages[index].message,
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
      ),
    );
  }

  Widget buildMessageList() {
    return Container(
      height: height,
      width: width,
      child: ListView.builder(
        controller: scrollController,
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return buildSingleMessage(index);
        },
      ),
    );
  }

  Widget buildChatInput() {
    return Container(
      width: width * 0.7,
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.only(left: 40.0),
      child: TextField(
        decoration: InputDecoration.collapsed(
          hintText: 'Send a message...',
        ),
        controller: textController,
      ),
    );
  }

  Widget buildSendButton() {
    return FloatingActionButton(
      backgroundColor: Colors.indigoAccent,
      onPressed: () {
        if (textController.text.isNotEmpty) {
          socket.emit('send_message',
              json.encode({'user_id': 1, 'message': textController.text}));
          this.setState(() => messages.add(Message(1, textController.text)));
          textController.text = '';
          scrollController.animateTo(
            scrollController.position.maxScrollExtent * 1.3,
            duration: Duration(milliseconds: 600),
            curve: Curves.ease,
          );
        }
      },
      child: Icon(
        Icons.send,
        size: 20,
        color: Colors.white,
      ),
    );
  }

  Widget buildInputArea() {
    return Container(
      height: height * 0.1,
      width: width,
      child: Row(
        children: <Widget>[
          buildChatInput(),
          buildSendButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.maybeOf(context).size.height * 0.6;
    width = MediaQuery.maybeOf(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: height * 0.1),
            buildMessageList(),
            buildInputArea(),
          ],
        ),
      ),
    );
  }
}

class Others extends StatelessWidget {
  String username;
  String message;

  Others({this.username, this.message});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text('@' + username),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text(message),
            decoration: new BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
          )
        ],
      ),
    );
  }
}

class You extends StatelessWidget {
  String message;

  You({this.message});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        alignment: Alignment.topRight,
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Text(message),
          decoration: new BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
        ));
  }
}

class Message {
  int user_id;
  String message;
  Message(this.user_id, this.message);
}
