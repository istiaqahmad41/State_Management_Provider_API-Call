//with provider--1
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'PostListScreen.dart';
import 'PostProvider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostListScreen(),
    );
  }
}