import 'package:elec_clone/screens/auth_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWithPhone extends StatefulWidget {
  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  var phoneController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;


  var otpController = TextEditingController();
  bool otpCodeVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: phoneController,
              maxLength: 13,
              decoration: InputDecoration(hintText: 'Phone No.'),
            ),
            Visibility(
              visible: otpCodeVisible,
              child: TextField(controller: otpController,
                decoration: InputDecoration(labelText: "Code"),),
            ),
            ElevatedButton(
                onPressed: () {
                  AuthenticationHelper.verifyNumber(phoneController);
                },
                child: otpCodeVisible
                    ? const Icon(Icons.arrow_forward_rounded)
                    : const Text("Verify")),
            ElevatedButton(
                onPressed: () {
                },
                child: const Text("Print OTP"))
          ],
        ),
      ),
    );
  }

}
