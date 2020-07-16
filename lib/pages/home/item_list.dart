import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiting_list_app/bloc/home/item_bloc.dart';
import 'package:waiting_list_app/bloc/home/item_state.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: BlocBuilder(
      bloc: BlocProvider.of<ItemBloc>(context),
      builder: (context, ItemState state) => ListView(
        children: state.items
            .map((e) => ListTile(
                  leading: IconButton(
                    onPressed: () {
                      BlocProvider.of<ItemBloc>(context).onUpdate(e);
                    },
                    icon: Icon(
                      Icons.check,
                      color: e.completed ? Colors.green : Colors.red,
                    ),
                  ),
                  title: Text(e.body,
                      style: TextStyle(
                          decoration: !e.completed
                              ? TextDecoration.none
                              : TextDecoration.lineThrough)),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      BlocProvider.of<ItemBloc>(context).onDelete(e);
                    },
                  ),
                ))
            .toList(),
      ),
    ));
  }
}
