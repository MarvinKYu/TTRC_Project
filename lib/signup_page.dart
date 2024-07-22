// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignupPage({Key? key, required this.showLoginPage}) : super (key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children : [
            //title
             Text(
              "Sign Up below:",
              style: GoogleFonts.teko(
                fontWeight: FontWeight.bold, 
                fontSize: 54
                ),
              ),
            SizedBox(height:40),
          
            //email textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 400),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height:20),
          
            //password textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 400),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height:20),
          
            //login button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 550),
              child: MaterialButton(
                onPressed: () async {
                  await signUp();
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  )
                ),
              )
            ),
            SizedBox(height:10),
          
            //Sign up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: widget.showLoginPage,
                  child: Text(
                    ' Back to Login',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                )
              ],)
          
          ]),
        ),
      )
    );
  }
}