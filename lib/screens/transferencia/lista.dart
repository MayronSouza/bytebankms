// Lista as tranferências
import 'package:bytebankms/components/item.dart';
import 'package:bytebankms/models/transferencias.dart';
import 'package:bytebankms/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const String textTitulo = 'Tranferências';

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textTitulo,
        ),
      ),
      body: Consumer<Transferencias>(builder: (context, transferencias, child) {
        return ListView.builder(
          itemCount: transferencias.transferencias.length,
          itemBuilder: (context, i) {
            final transferencia = transferencias.transferencias[i];
            return ItemTransferencia(transferencia);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          );
        },
      ),
    );
  }
}
