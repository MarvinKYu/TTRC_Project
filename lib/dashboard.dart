// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget{
  const Dashboard ({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Logged in as: ${user.email!}'),
            SizedBox(height:10),
            MaterialButton(
              onPressed: () {
              FirebaseAuth.instance.signOut();
              },
              color: Colors.blueAccent,
              child: Text(
                'Logout',
                style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        )
              )
            )
          ]
        )
      ),
    );
  }
}