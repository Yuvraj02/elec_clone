import 'package:elec_clone/model/product_model.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {

  Product product;

  CartItem(this.product,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: Color(0xffedeff4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 90,
                width: 90,
                child: Image.network(product.productImageUrl),
              ),
              SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  //TODO:-----------------------------REMOVE THE BELOW HARDCODED TEXT STRING -----------------------


                  Text("boat Airdopes 131",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 4,),
                  Text("Rs. ${product.discountPrice}",style: TextStyle(fontSize: 18),),
                  SizedBox(height: 4,),
                  Text("Rs. ${product.price}",style: TextStyle(decoration: TextDecoration.lineThrough),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
