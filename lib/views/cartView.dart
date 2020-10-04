import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:online_ordering_watchdog/model/cartData.dart';

class CartTile extends StatelessWidget {
  final String parentItemName;
  final List<String> modifiers;
  final List<String> catModifierList;
  final String categoryName;

  CartTile(
      {this.parentItemName,
      this.modifiers,
      this.catModifierList,
      this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListTile(
        leading: Column(
          children: <Widget>[
            Text(categoryName),
            ItemModifierListView(modifiers: catModifierList),
            Text(parentItemName),
            ItemModifierListView(modifiers: modifiers)
          ],
        ),
      ),
    );
  }
}

class ItemModifierListView extends StatelessWidget {
  ItemModifierListView({
    @required this.modifiers,
  });

  List<String> modifiers;

  /// creates a dynamic container size relative to amount modifiers in list
  _containerSizeMaker() => modifiers.length.toDouble() * 22;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: modifiers.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    modifiers[index],
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class CartConsumer extends StatelessWidget {
  final String orderId;
  CartConsumer({this.orderId});
  @override
  Widget build(BuildContext context) {
    return Consumer<CartItemData>(
      builder: (context, cartItem, child) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: Provider.of<CartItemData>(context).cartCount,
          itemBuilder: (context, index) {
            return Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    border: Border.all(width: 1.0, color: Colors.grey)),
                child: CartTile(
                  categoryName: cartItem.cart[index].categoryName,
                  catModifierList: cartItem.cart[index].catModifierList,
                  parentItemName: cartItem.cart[index].parentName,
                  modifiers: cartItem.cart[index].modifiers,
                ));
          },
        );
      },
    );
  }
}

orderCreated(List data) {
  for (var i in data) {
    print(i["CreatedDate"]);
    var difference = DateTime.now().difference(i["CreatedDate"]);
    print(difference.inSeconds);
  }
}
