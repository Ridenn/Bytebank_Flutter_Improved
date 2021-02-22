import 'package:bytebank/components/text_fields.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _titleAppBar = 'Receber depósito';
const _labelValor = 'Valor';
const _hintValor = '0.00';
const _buttonConfirmationText = 'Confirmar';

class FormularioDeposito extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFields(
              controller: _controladorCampoValor,
              label: _labelValor,
              hint: _hintValor,
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_buttonConfirmationText),
              onPressed: () => _criaDeposito(context),
            ),
          ],
        ),
      ),
    );
  }

  _criaDeposito(context) {
    final double valor = double.tryParse(_controladorCampoValor.text);
    final depositoValido = _validaDeposito(valor);

    if (depositoValido) {
      _atualizaEstado(context, valor);
      Navigator.pop(context);
    }
  }

  _validaDeposito(valor) {
    final _campoPreenchido = valor != null && valor > 0;
    return _campoPreenchido;
  }

  _atualizaEstado(context, valor){
    //Pega o valor da classe Saldo e chama o método 'adiciona' para adicionar um valor que o user inputar
    Provider.of<Saldo>(context, listen:false).adiciona(valor);
  }
}
