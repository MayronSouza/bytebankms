import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormularioTransferencia(),
    );
  }
}

// Formulário de Transferência
class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _numeroContaController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Criando Tranferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(
              controlador: _numeroContaController,
              rotulo: 'Numedo da Conta',
              dica: '0000'),
          Editor(
            controlador: _valorController,
            rotulo: 'Valor',
            dica: '0.00',
            icone: Icons.monetization_on,
          ),
          RaisedButton(
            color: Colors.cyan,
            child: Text(
              'Confirmar',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              criarTranferencia();
            },
          )
        ],
      ),
    );
  }

  void criarTranferencia() {
    final String numeroConta = this._numeroContaController.text;
    final double valor = double.tryParse(this._valorController.text);
    
    if (numeroConta != null && valor != null) {
      final _transferencia = Transferencia(valor, numeroConta);
    
      debugPrint('$_transferencia');
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  const Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
    );
  }
}

// Lista as tranferências
class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tranferências',
        ),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, '1004')),
          ItemTransferencia(Transferencia(200.0, '1002')),
          ItemTransferencia(Transferencia(400.0, '2031')),
          ItemTransferencia(Transferencia(100.0, '1007')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Hot Reload está funcionando'),
        child: Icon(Icons.add),
      ),
    );
  }
}

// Cada item da lista de tranferências
class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._transferencia.value.toString()),
        subtitle: Text(this._transferencia.accountNumber),
      ),
    );
  }
}

// Uma transferência
class Transferencia {
  final double value;
  final String accountNumber;

  Transferencia(this.value, this.accountNumber);

  @override
  String toString() =>
      'Transferencia(value: $value, accountNumber: $accountNumber)';
}
