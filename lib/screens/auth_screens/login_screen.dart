import 'package:elec_clone/helper_classes/auth_helper.dart';
import 'package:elec_clone/screens/auth_screens/login_with_phone_screen.dart';
import 'package:elec_clone/screens/auth_screens/register_screen.dart';
import 'package:elec_clone/screens/cart_screen.dart';
import 'package:flutter/material.dart';

import '../../model/product_model.dart';

class Authentication extends StatelessWidget {

  Product? product;

  //NOTE : THIS MIGHT PRODUCE ERROR BECAUSE PRODUCT HERE CAN BE NULL
  Authentication({Key? key, this.product}) : super(key: key);


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => RegisterScreen()));
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () async {
                        //var UID = await AuthenticationHelper.getCurrentUID();
                        //print(UID);
                        if (await AuthenticationHelper.signIn(
                                emailController.text,
                                passwordController.text) ==
                            null) {
                          // TODO // Step 1. Add the Product to the Cart
                          // TODO // Step 2. Log in the person
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => Cart(product: product,)));
                        } else {
                          print("Invalid Email or Password");
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginWithPhone()));
                  },
                  child: const Text(
                    "Login with Phone",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
