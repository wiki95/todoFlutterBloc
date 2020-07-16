import 'package:bloc/bloc.dart';
import 'package:waiting_list_app/models/home/item.dart';

import 'item_event.dart';
import 'item_state.dart';

class ItemBloc extends Bloc<ItemEvents, ItemState> {
  ItemBloc() : super(ItemState.initial());
  void onAddItem(item) {
    add(AddItemEvent(item));
  }

  void onDeleteAll() {
    add(DeleteItemsEvent());
  }

  void onDelete(Item item) {
    add(DeleteItemEvent(item));
  }

  void onUpdate(Item item) {
    add(UpdateItemEvent(item));
  }

  @override
  Stream<ItemState> mapEventToState(ItemEvents event) async* {
    if (event is AddItemEvent) {
      yield ItemState.changeItem([]
        ..addAll(state.items)
        ..add(event.item));
    }
    if (event is DeleteItemEvent) {
      state.items.removeWhere((element) => element == event.item);
      yield ItemState.changeItem(state.items);
    }
    if (event is DeleteItemsEvent) {
      yield ItemState.initial();
    }
    if (event is UpdateItemEvent) {
      int index = state.items.indexOf(event.item);
      state.items.removeAt(index);
      state.items
          .insert(index, event.item.copyWith(completed: !event.item.completed));
      yield ItemState.changeItem(state.items);
    }
  }
}
