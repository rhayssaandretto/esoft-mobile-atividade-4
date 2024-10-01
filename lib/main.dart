import 'package:flutter/material.dart';
import 'package:my_bank_app/screens/transacoes.dart';

void main() {
  runApp(const MyBank());
}

class MyBank extends StatelessWidget {
  const MyBank({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blueAccent,
          buttonTheme: const ButtonThemeData(
              buttonColor: Colors.greenAccent,
              textTheme: ButtonTextTheme.primary)),
      home: Transacoes(),
    );
  }
}
