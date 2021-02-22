import 'package:bytebank/components/text_fields.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Criando Transferência';
const _labelNumeroConta = 'Número da Conta';
const _hintNumeroConta = '0000';
const _labelValor = 'Valor';
const _hintValor = '0.00';
const _buttonConfirmationText = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {
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
              icon: Icons.monetization_on,
            ),
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
    final transferenciaValida =
        _validaTransferencia(context, numeroConta, valor);

    if (transferenciaValida) {
      final novaTransferencia = Transferencia(valor, numeroConta);

      _atualizaEstado(context, novaTransferencia, valor);
      Navigator.pop(context);
    }
  }

  _validaTransferencia(context, numeroConta, valor) {
    final _camposPreenchidos = numeroConta != null && valor != null;
    final _saldoSuficiente = valor <=
        Provider.of<Saldo>(
          context,
          listen: false,
        ).valor;
    return _camposPreenchidos && _saldoSuficiente;
  }

  _atualizaEstado(context, novaTransferencia, valor) {
    Provider.of<Transferencias>(
      context,
      listen: false,
    ).adiciona(novaTransferencia);
    Provider.of<Saldo>(
      context,
      listen: false,
    ).subtrai(valor);
  }
}
