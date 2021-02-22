import 'file:///F:/workspace/Flutter/Bytebank_Flutter_Improved/lib/screens/dashboard/saldo.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bytebank'),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: SaldoCard(Saldo(10.0)),
        ));
  }
}
