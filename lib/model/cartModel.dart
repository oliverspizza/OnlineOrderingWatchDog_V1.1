import 'dart:core';

class Cart {
  final String parentName;
  final List<String> modifiers;
  final String categoryName;
  final List<String> catModifierList;

  Cart(
      {this.parentName,
      this.modifiers,
      this.catModifierList,
      this.categoryName});
}
