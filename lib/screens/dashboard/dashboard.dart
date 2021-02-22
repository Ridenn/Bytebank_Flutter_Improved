import 'file:///F:/workspace/Flutter/Bytebank_Flutter_Improved/lib/screens/dashboard/saldo.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/screens/deposito/formulario.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:bytebank/screens/transferencia/ultimas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _appTitle = 'Bytebank';
const _depositText = 'Receber depósito';
const _newTransferText = 'Nova transferência';

class Dashboard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(_appTitle),
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SaldoCard(),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(_depositText),
                      color: Colors.green,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return FormularioDeposito();
                            },
                          ),
                        );
                      },
                    ),
                    RaisedButton(
                      color: Colors.green,
                      child: Text(_newTransferText),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return FormularioTransferencia();
                        }));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          UltimasTransferencias()
        ]));
  }
}
