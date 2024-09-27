import 'package:custoviagem/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppCustoViagem());
}

class AppCustoViagem extends StatelessWidget {
  const AppCustoViagem({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App Custo Viagem",
      home: Scaffold(
        body: Splashscreen(),
      ),
    );
  }
}