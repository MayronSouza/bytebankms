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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Tranferência'),
      ),
      body: Column(
        children: <Widget>[
          TextField(),
          TextField(),
          RaisedButton(
            onPressed: null,
          )
        ],
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
}
