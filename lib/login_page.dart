// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super (key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [
          //title
           Text(
            "TT Ratings Calculator",
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
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    )
                ),
              )
            )
          ),
          SizedBox(height:10),

          //Sign up
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' Sign up',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                )
              )
            ],)

        ]),
      )
    );
  }
}