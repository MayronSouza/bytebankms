// Formulário de Transferência
import 'package:bytebankms/components/editor.dart';
import 'package:bytebankms/models/transferencia.dart';
import 'package:flutter/material.dart';

const String textTitulo = 'Criando Tranferência';

const String textRotuloNumeroConta = 'Numedo da Conta';
const String textDicaNumeroConta = '0000';

const String textRotuloValor = 'Valor';
const String textDicaValor = '0.00';

const String textButton = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _numeroContaController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(textTitulo),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _numeroContaController,
              rotulo: textRotuloNumeroConta,
              dica: textDicaNumeroConta,
            ),
            Editor(
              controlador: _valorController,
              rotulo: textRotuloValor,
              dica: textDicaValor,
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(
                textButton,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              onPressed: () {
                criarTranferencia(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void criarTranferencia(BuildContext context) {
    final String numeroConta = this._numeroContaController.text;
    final double valor = double.tryParse(this._valorController.text);

    if (numeroConta != null && valor != null) {
      final _transferenciaCriada = Transferencia(valor, numeroConta);

      Navigator.pop(context, _transferenciaCriada);
    }
  }
}
