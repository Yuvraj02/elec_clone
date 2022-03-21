import 'package:elec_clone/screens/auth_helper.dart';
import 'package:elec_clone/screens/auth_screens/login_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var uid = "";

  assignUID() async {
    uid = await AuthenticationHelper.getCurrentUID();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            AuthenticationHelper.signOut();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => Authentication()));
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                assignUID();
                print(uid);
              },
              child: Text("PRINT UID"),
            ),
            Text(uid),
          ],
        ),
      ),
    );
  }
}
