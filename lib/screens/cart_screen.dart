import 'package:elec_clone/model/product_model.dart';
import 'package:elec_clone/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  Product? product;

  Cart({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: product == null ? Center(child: Text("Your Cart is Empty")) : SafeArea(child: CartItem(product!)));
  }
}
