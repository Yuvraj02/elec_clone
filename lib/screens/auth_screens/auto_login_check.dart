import 'package:elec_clone/screens/auth_helper.dart';
import 'package:elec_clone/screens/auth_screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../HomePage.dart';

//TODO : Use named Routes

class AuthController extends StatelessWidget {
  const AuthController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthenticationHelper.onAuthStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData && FirebaseAuth.instance.currentUser!.emailVerified) {
            return const Home();
          } else {
            return Authentication();
          }
        });
  }
}
