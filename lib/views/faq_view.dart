import 'package:flutter/material.dart';

class FaqView extends StatefulWidget {
  @override
  _FaqViewState createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: Center(
        child: Text('FAQ'),
      ),
    );
  }
}
