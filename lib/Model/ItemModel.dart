import 'package:flutter/material.dart';

class Item {
  final int id;
  final String name;
  final String address;
  final int size;
  final int quantity;

  Item({this.id, this.name, this.address, this.size, this.quantity});
}

class CartItemListProvider extends ChangeNotifier {
  List<Item> cartItemList = [];

  addItem(Item item) async {
    cartItemList.add(item);

    notifyListeners();
  }

  removeItem(Item item) async {
    cartItemList.remove(item);
    notifyListeners();
  }
}
