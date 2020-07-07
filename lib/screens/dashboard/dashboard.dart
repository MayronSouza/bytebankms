import 'package:bytebankms/models/saldo.dart';
import 'package:bytebankms/screens/dashboard/saldo_card.dart';
import 'package:bytebankms/screens/deposito/formulario.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BytebankMS'),
      ),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          RaisedButton(
            child: Text('Receber depósito'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FormularioDeposito();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
