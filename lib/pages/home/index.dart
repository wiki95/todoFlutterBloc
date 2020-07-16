import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiting_list_app/bloc/home/item_bloc.dart';

import 'home_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _itemBloc = ItemBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _itemBloc,
      child: HomePage(),
    );
  }

  @override
  void dispose() {
    _itemBloc.close();
    super.dispose();
  }
}
