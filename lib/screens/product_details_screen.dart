import 'package:elec_clone/helper_classes/auth_helper.dart';
import 'package:elec_clone/model/product_model.dart';
import 'package:elec_clone/screens/auth_screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';

class ProductDetails extends StatelessWidget {
  Product product;

  ProductDetails(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.productImageUrl),
            SizedBox(
              height: 16,
            ),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            Text("Current Deal : ₹${product.discountPrice}",
                style: TextStyle(color: Color(0xFFa30b00), fontSize: 24)),
            SizedBox(
              height: 10,
            ),
            Text(
              "M.R.P : ₹${product.price}",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  decoration: TextDecoration.lineThrough),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "You Save : 56%",
              style: TextStyle(fontSize: 20, color: Colors.green),
            )
          ],
        ),
      )),
      bottomNavigationBar: Row(
        children: [
          GestureDetector(
            onTap: (){AuthenticationHelper.signOut();},
            child: Container(
                height: 50,
                color: Colors.grey,
                width: MediaQuery.of(context).size.width / 2,
                child: Center(child: Text("Add to Cart"))),
          ),
          GestureDetector(
            onTap: (){
              if(AuthenticationHelper.user == null){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Authentication(product: product,)));
              }else{
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Cart(product:product,)));
              }
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2,
              child: Center(
                  child: Text(
                "Buy Now",
                style: TextStyle(color: Colors.white),
              )),
              color: Color(0xfffe5a37),
            ),
          )
        ],
      ),
    );
  }
}
