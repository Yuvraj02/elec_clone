import 'package:elec_clone/helper_classes/auth_helper.dart';
import 'package:elec_clone/screens/auth_screens/login_screen.dart';
import 'package:elec_clone/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../widgets/search_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Product> products=[Product("boat Airdopes 131 - Wireless Earbuds", 2990, 1299, 5.0, "https://cdn.shopify.com/s/files/1/0057/8938/4802/products/616b4ead-bbd9-4a16-aeab-8d331a16f697_720x.png?v=1642405569")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfffefe),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(),
              SizedBox(
                height: 16,
              ),
              Text(
                "All Products",
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  ProductCard(products[0]),
                  ProductCard(products[0]),
                  ProductCard(products[0]),
                  ProductCard(products[0]),
                  ProductCard(products[0]),
                  ProductCard(products[0]),
                  ProductCard(products[0]),
                ],
              )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF191818),
          selectedItemColor: Color(0xFFbc4942),
          unselectedItemColor: Color(0xFF878788),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: "Home",
                backgroundColor: Color(0xFF191818)),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border_outlined), label: "Wishlist"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: "Account"),
          ],
        ),
      ),
    );
  }
}
