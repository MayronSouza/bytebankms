import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Tranferências',
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => print('Fui clicado'),
            child: Icon(Icons.add),
          ),
          body: ListaTransferencias(),
        ),
      ),
    );

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemTransferencia(Transferencia(100.0, '1000')),
        ItemTransferencia(Transferencia(200.0, '1002')),
        ItemTransferencia(Transferencia(400.0, '2031')),
        ItemTransferencia(Transferencia(100.0, '1007')),
      ],
    );
  }
}

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

class Transferencia {
  final double value;
  final String accountNumber;

  Transferencia(this.value, this.accountNumber);
}
