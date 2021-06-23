import 'package:flutter/material.dart';
import 'package:send_video/views/home_view.dart';
import 'package:send_video/views/chat_view.dart';

void main() => runApp(MyApp());///homeview ile başlıyor.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: ChatView(),
    );
  }
}

