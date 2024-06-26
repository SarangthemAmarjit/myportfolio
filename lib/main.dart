import 'package:flutter/material.dart';
import 'package:myportfolio/pages/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: ThemeData(
          fontFamily: 'KulimPark',
          useMaterial3: false,
        ));
  }
}
