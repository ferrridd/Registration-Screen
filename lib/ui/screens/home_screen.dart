import 'package:flutter/material.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<LoginScreenState> loginScreenKey = GlobalKey<LoginScreenState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue[800],
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                LoginScreen(
                  key: loginScreenKey,
                ),
              ],
            ),
          ),
        ));
  }
}
