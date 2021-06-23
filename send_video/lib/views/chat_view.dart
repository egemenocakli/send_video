import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(100,70),
          child: AppBar(

            title: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("Sohbet",style: TextStyle(fontSize: 27),),
            ),
      )),
    );
  }
}
