// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ttrc_project/auth/auth_page.dart';
import 'package:ttrc_project/dashboard.dart';

class MainPage extends StatelessWidget{
  const MainPage ({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Dashboard();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}