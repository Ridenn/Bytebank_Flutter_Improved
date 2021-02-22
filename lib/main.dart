import 'file:///F:/workspace/Flutter/Bytebank_Flutter_Improved/lib/screens/dashboard/dashboard.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Saldo(0),
        ),
        ChangeNotifierProvider(
          create: (context) => Transferencias(),
        )
      ],
      child: BytebankApp(),
    ));

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
