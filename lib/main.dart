import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_gui/widget/main-widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<int> selectedIndexes = [];

  @override
  Widget build(BuildContext context) {
    return Material(child: MainWidget());
  }
}
