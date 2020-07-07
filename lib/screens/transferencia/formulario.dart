// Formulário de Transferência
import 'package:bytebankms/components/editor.dart';
import 'package:bytebankms/models/saldo.dart';
import 'package:bytebankms/models/transferencia.dart';
import 'package:bytebankms/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const String _tituloAppBar = 'Criando Tranferência';

const String _rotuloNumeroConta = 'Numedo da Conta';
const String _dicaNumeroConta = '0000';

const String _rotuloValor = 'Valor';
const String _dicaValor = '0.00';

const String _textoBotao = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _numeroContaController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

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
              controlador: _numeroContaController,
              rotulo: _rotuloNumeroConta,
              dica: _dicaNumeroConta,
            ),
            Editor(
              controlador: _valorController,
              rotulo: _dicaValor,
              dica: _rotuloValor,
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(
                _textoBotao,
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
    Provider.of<Transferencias>(context, listen: false)
        .adiciona(novaTransferencia);
    Provider.of<Saldo>(context, listen: false).subtrae(valor);
  }
}
