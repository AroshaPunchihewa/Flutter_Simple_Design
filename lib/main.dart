import 'package:flutter/material.dart';

import 'package:musicstore/Sidebar.dart';

import 'package:musicstore/Screen/login_page/login_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}