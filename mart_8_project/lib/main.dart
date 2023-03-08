import 'package:flutter/material.dart';
import 'package:mart_8_project/home_page.dart';
import 'package:mart_8_project/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // themeMode: ThemeMode.dark,
      // theme: ThemeData.dark(),
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyLoginPage(),
    );
  }
}
