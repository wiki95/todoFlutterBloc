import 'package:flutter/material.dart';

import 'input_with_btn.dart';
import 'item_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[InputWithAddBtn(), ItemList()],
        ),
      ),
    );
  }
}
