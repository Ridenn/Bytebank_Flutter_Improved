import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:bytebank/transferencias.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _titulo = 'Últimas transferências';

const _allTransfersText = 'Ver todas transferências';
const _noTransferText = 'Você ainda não cadastrou nenhuma transferência.';

class UltimasTransferencias extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          _titulo,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Consumer<Transferencias>(builder: (context, transferencias, child) {
          final _ultimasTransferencias =
              transferencias.transferencias.reversed.toList();
          final _quantidade = transferencias.transferencias.length;
          int tamanho = 3;

          if (_quantidade == 0) {
            return SemTransferenciaCadastrada();
          }

          if (_quantidade <= 3) {
            tamanho = _quantidade;
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: tamanho,
            shrinkWrap: true,
            itemBuilder: (context, indice) {
              return ItemTransferencia(_ultimasTransferencias[indice]);
            },
          );
        }),
        RaisedButton(
          color: Colors.green,
          child: Text(_allTransfersText),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ListaTransferencias();
            }));
          },
        )
      ],
    );
  }
}

class SemTransferenciaCadastrada extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Text(
          _noTransferText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
