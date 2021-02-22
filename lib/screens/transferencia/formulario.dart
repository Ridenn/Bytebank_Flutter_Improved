import 'package:bytebank/components/text_fields.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';
const _labelNumeroConta = 'Número da Conta';
const _hintNumeroConta = '0000';
const _labelValor = 'Valor';
const _hintValor = '0.00';
const _buttonConfirmationText = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransfetenciaState();
  }
}

class FormularioTransfetenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFields(
                controller: _controladorCampoNumeroConta,
                label: _labelNumeroConta,
                hint: _hintNumeroConta),
            TextFields(
                controller: _controladorCampoValor,
                label: _labelValor,
                hint: _hintValor,
                icon: Icons.monetization_on),
            RaisedButton(
              child: Text(_buttonConfirmationText),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
