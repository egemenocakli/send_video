import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:send_video/views/login_view.dart';

import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp();

  runApp(MyApp());
} ///homeview ile başlıyor.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: LoginView(), //ChatView(),
    );
  }
}

