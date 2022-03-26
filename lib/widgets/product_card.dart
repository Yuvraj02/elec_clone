import 'package:elec_clone/model/product_model.dart';
import 'package:flutter/material.dart';

import '../screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {

  Product product;

  ProductCard(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails(product)));},
      child: Container(
        height: 210,
        width: 170,
        decoration: BoxDecoration(
            color: const Color(0xffedeff4), borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  height: constraints.maxWidth - 79,
                  child: Image.network(product.productImageUrl),
                ),
              ),
               Text(product.name),
              const SizedBox(
                height: 10,
              ),
              Row(

                children: [
                  Column(
                    children: [
                      Text(
                        "Rs. ${product.discountPrice}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Rs. ${product.price}",
                        style: const TextStyle(decoration: TextDecoration.lineThrough),
                      )
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.star_rounded,color: Colors.amberAccent,),
                  Text("${product.rating}")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
