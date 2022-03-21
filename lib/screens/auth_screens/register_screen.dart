import 'package:elec_clone/screens/auth_helper.dart';
import 'package:elec_clone/screens/auth_screens/verify_email_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Register"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: const InputDecoration(
                          hintText: "First Name", border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                      child: TextFormField(
                    controller: lastNameController,
                    decoration: const InputDecoration(
                        hintText: "Last Name", border: OutlineInputBorder()),
                  )),
                ],
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Email", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: "Password", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                    hintText: "Confirm Password", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                  onPressed: () {
                    AuthenticationHelper.signUp(
                        emailController.text, confirmPasswordController.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => VerifyEmail()));
                  },
                  child: const Text("Register"))
            ],
          ),
        )

        // body: Center(child: Text("Working"),),
        );
  }
}
