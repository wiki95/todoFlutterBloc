import 'package:waiting_list_app/models/home/item.dart';

abstract class ItemEvents {}

class AddItemEvent extends ItemEvents {
  final Item item;
  AddItemEvent(this.item);
  Item get prop => item;
}

class DeleteItemEvent extends ItemEvents {
  final Item item;
  DeleteItemEvent(this.item);
}

class DeleteItemsEvent extends ItemEvents {}

class UpdateItemEvent extends ItemEvents {
  final Item item;
  UpdateItemEvent(this.item);
}
