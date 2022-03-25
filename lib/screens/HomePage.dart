import 'package:elec_clone/screens/auth_helper.dart';
import 'package:elec_clone/screens/auth_screens/login_screen.dart';
import 'package:elec_clone/screens/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // var uid = "";
  //
  // assignUID() async {
  //   uid = await AuthenticationHelper.getCurrentUID();
  //   setState(() {});
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfffefe),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SearchBar(),
            ],
          ),
        ),
      ),
    );
  }
}
