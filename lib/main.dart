import 'package:flutter/material.dart';
import 'package:malsat/pages/auth_page/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Malsat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Auth(),
    );
  }
}
