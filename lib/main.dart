import 'package:flutter/material.dart';
import 'package:musicstore/Screen/file_upload/fileupload.dart';

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
      home: FileUpload(),//FileUpload(),//LoginScreen(),//add here view 1st
    );
  }
}