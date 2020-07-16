import 'package:flutter/foundation.dart';

class Item {
  int id;
  final String body;
  bool completed;

  Item({@required this.id, @required this.body, this.completed = false});

  Item copyWith({int id, String body, bool completed}) {
    return Item(
        id: id ?? this.id,
        body: body ?? this.body,
        completed: completed ?? this.completed);
  }
}
