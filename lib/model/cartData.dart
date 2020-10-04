import 'dart:collection';
import 'cartModel.dart';
import 'package:flutter/cupertino.dart';

class CartItemData extends ChangeNotifier {
  List<Cart> _cart = [];

  addToCart(
      {String parentName,
      List<String> modifiers,
      List<String> catModifierList,
      String categoryName}) {
    final addItems = Cart(
        parentName: parentName,
        modifiers: modifiers,
        categoryName: categoryName,
        catModifierList: catModifierList);
    _cart.add(addItems);
    notifyListeners();
  }

  UnmodifiableListView<Cart> get cart {
    return UnmodifiableListView(_cart);
  }

  int get cartCount => _cart.length;
}

//class CartData {
//List<Cart> _cart = [];
//
//addToCart({
//  String item,
//  List<String> modifiers,
//}) {
//  final addItems = Cart(item: item, modifiers: modifiers);
//  _cart.add(addItems);
//}
//
//UnmodifiableListView<Cart> get cart {
//  return UnmodifiableListView(_cart);
//}
//
//int get cartCount => _cart.length;
//}
