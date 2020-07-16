import 'package:waiting_list_app/models/home/item.dart';

class ItemState {
  List<Item> items;

  ItemState._();

  factory ItemState.initial() {
    return ItemState._()..items = <Item>[];
  }
  factory ItemState.changeItem(List<Item> lst) {
    return ItemState._()..items = lst;
  }
}
