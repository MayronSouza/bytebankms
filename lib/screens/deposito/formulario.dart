import 'package:bytebankms/components/editor.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Receber depósito';
const _dicaCampoValor = '0.00';
const _rotuloCampoValor = 'Valor';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioDeposito extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(
                _textoBotaoConfirmar,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              onPressed: () {
                _criaDeposito(context);
              },
            )
          ],
        ),
      ),
    );
  }

  _criaDeposito(context) {
    Navigator.pop(context);
  }
}
