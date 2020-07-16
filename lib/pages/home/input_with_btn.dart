import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiting_list_app/bloc/home/item_bloc.dart';
import 'package:waiting_list_app/models/home/item.dart';

class InputWithAddBtn extends StatefulWidget {
  @override
  _InputWithAddBtnState createState() => _InputWithAddBtnState();
}

class _InputWithAddBtnState extends State<InputWithAddBtn> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              if (controller.text != '') {
                BlocProvider.of<ItemBloc>(context)
                    .onAddItem(Item(id: 0, body: controller.text));
                controller.text = '';
              }
            },
            child: Text('Add'),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Container(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(hintText: 'Type your todos'),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          IconButton(
            onPressed: () {
              BlocProvider.of<ItemBloc>(context).onDeleteAll();
            },
            icon: Icon(Icons.clear_all),
          )
        ],
      ),
    );
  }
}
