import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:send_video/widgets/message_input_widget.dart';
import 'package:send_video/widgets/message_widget.dart';

class ChatView extends StatelessWidget {
  //var now = DateTime.now().hour;
  //var now2 = DateTime.now().minute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(100, 70),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Konuştuğumuz Kişi",
             // style: TextStyle(fontSize: 27),
            ),
          ),
        ),
      ),
      body: Column(

        children: [
          Expanded(
            flex: 9,
            child: ListView(
              children: [
                MessageWidget(
                    messageText: "deneme",
                    sendTime: Timestamp.now(),
                    ownMessage: true
                ),
                MessageWidget(
                    messageText: "selam",
                    sendTime: Timestamp.now(),
                    ownMessage: false
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: MessageInputWidget(),
          ),
        ],
      ),
    );
  }
}


