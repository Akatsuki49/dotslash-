import 'package:flutter/material.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyEduApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginView(),
    );
  }
}
