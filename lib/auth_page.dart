import 'package:flutter/material.dart';
import 'package:ttrc_project/login_page.dart';
import 'package:ttrc_project/signup_page.dart'; 

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super (key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();

}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
}

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showSignupPage: toggleScreens);
    } else {
      return SignupPage(showLoginPage: toggleScreens,);
    }
  }
}