// Lista as tranferências
import 'package:bytebankms/components/item.dart';
import 'package:bytebankms/models/transferencia.dart';
import 'package:bytebankms/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const String textTitulo = 'Tranferências';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencia = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textTitulo,
        ),
      ),
      body: ListView.builder(
        itemCount: widget._transferencia.length,
        itemBuilder: (context, i) {
          final transferencia = widget._transferencia[i];
          return ItemTransferencia(transferencia);
        },
      ),
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
          ).then((transferencia) {

            if (transferencia != null) {
              setState(() {
                widget._transferencia.add(transferencia);
              });
            }
          });
        },
      ),
    );
  }
}