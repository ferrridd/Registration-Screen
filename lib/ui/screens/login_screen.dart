import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:login_screen/presentation/twitter_icon_icons.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController confirmPasswordController2 = TextEditingController();
  TextEditingController emailController = TextEditingController();

  FocusNode focusNode = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  bool isVisible = false;

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login is successful')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login is unsuccessfull')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              autofocus: true,
              focusNode: focusNode,
              controller: usernameController,
              textInputAction: TextInputAction.next,
              validator: (String? val) {
                if (val == null || val.isEmpty) {
                  return 'Please enter a username.';
                }
              },
              onFieldSubmitted: (value) => {focusNode2.requestFocus()},
              decoration: InputDecoration(
                  fillColor: Colors.blue[900],
                  filled: true,
                  hintText: "Name",
                  hintStyle: TextStyle(color: Colors.blue[800]),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              autofocus: true,
              focusNode: focusNode2,
              controller: emailController,
              textInputAction: TextInputAction.next,
              validator: (String? val) {
                if (val == null || val.isEmpty) {
                  return 'Please enter a mail.';
                }
                if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(val)) {
                  return 'Enter a valid email';
                }
              },
              onFieldSubmitted: (value) => {focusNode3.requestFocus()},
              decoration: InputDecoration(
                  fillColor: Colors.blue[900],
                  filled: true,
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.blue[800]),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                keyboardType: TextInputType.text,
                autofocus: true,
                focusNode: focusNode3,
                textInputAction: TextInputAction.next,
                controller: passwordController,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter a password.';
                  }
                  return null;
                },
                onFieldSubmitted: (value) => {focusNode4.requestFocus()},
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.blue[900],
                  filled: true,
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.blue[800]),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                keyboardType: TextInputType.name,
                autofocus: true,
                focusNode: focusNode4,
                controller: confirmPasswordController,
                textInputAction: TextInputAction.next,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter a password.';
                  }
                  if (val.trim() != passwordController.value.text) {
                    return "Passwords don't match";
                  }
                },
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.blue[900],
                  filled: true,
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(color: Colors.blue[800]),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                submitForm();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Center(
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                          color: Colors.blue[900], fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "By signing up you agree to the Terms&Conditions",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
