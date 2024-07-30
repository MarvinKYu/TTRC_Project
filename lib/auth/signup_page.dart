// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_field/date_field.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignupPage({Key? key, required this.showLoginPage}) : super (key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  DateTime userBirthDate = DateTime.now();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future signUp() async {
    try {
      //create user
      if (passwordConfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(), 
          password: _passwordController.text.trim()
        );
      }

      //add user details
      addUserDetails(
        _firstNameController.text.trim(), 
        _lastNameController.text.trim(), 
        _emailController.text.trim(),
        Timestamp.fromDate(userBirthDate),
      );

    } on Exception catch (e) {
      showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            content: Text(e.toString())
          );
        }
      );
    }
  }

  Future addUserDetails(String firstName, String lastName, String email, Timestamp birthDate) async {
    await FirebaseFirestore.instance.collection('users').add({
      'First Name': firstName,
      'Last Name': lastName,
      'Email': email,
      'Birth Date': birthDate,
    });
  }
  bool passwordConfirmed() {
    return _passwordController.text.trim() == _confirmController.text.trim();
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

            //firstName textfield
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
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'First Name',
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height:20),

            //lastName textfield
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
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Last Name',
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height:20),

            //birth date selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 400),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DateTimeFormField(
                    decoration: const InputDecoration(
                      labelText: 'Birth Date',
                    ),
                    mode: DateTimeFieldPickerMode.date,
                    lastDate: DateTime.now(),
                    initialPickerDateTime: DateTime.now(),
                    onChanged: (DateTime? value) {
                      userBirthDate = value!;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height:20),
          
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

            //confirm password textfield
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
                    controller: _confirmController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Confirm Password',
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