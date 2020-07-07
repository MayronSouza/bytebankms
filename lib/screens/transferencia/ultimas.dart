import 'package:bytebankms/components/item.dart';
import 'package:bytebankms/models/transferencias.dart';
import 'package:bytebankms/screens/transferencia/lista.dart';
import 'package:bytebankms/screens/transferencia/sem_transferencia.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _titulo = 'Últimas tranferências';

class UltimasTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          _titulo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        Consumer<Transferencias>(builder: (context, transferencias, child) {
          final _ultimasTransferencias =
              transferencias.transferencias.reversed.toList();
          final _quantidade = transferencias.transferencias.length;
          int tamanho = 2;

          if (_quantidade == 0) {
            return SemTransferenciaCadastrada();
          }

          if (_quantidade < 2) {
            tamanho = _quantidade;
          }

          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: tamanho,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return ItemTransferencia(
                _ultimasTransferencias[i],
              );
            },
          );
        }),
        RaisedButton(
          child: Text('Ver todas as transferências'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ListaTransferencias();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
