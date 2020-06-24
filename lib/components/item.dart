// Cada item da lista de tranferências
import 'package:bytebankms/models/transferencia.dart';
import 'package:flutter/material.dart';

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