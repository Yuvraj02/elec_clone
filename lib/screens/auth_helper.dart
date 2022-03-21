import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationHelper {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static String verificationIDRecieved = "";

  get user => _auth.currentUser;

  static Future signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  static Future signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  static Future signOut() async {
    await _auth.signOut();
    print("Signed Out");
  }

  //For Phone Number Verification
  static void verifyNumber(TextEditingController phoneController) {
    _auth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          print("Logged in");
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationIDRecieved = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  static Stream<User?> onAuthStateChanges() => _auth.authStateChanges();

  static Future<String> getCurrentUID() async {
    return _auth.currentUser!.uid;
  }
}
