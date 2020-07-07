import 'package:bytebankms/models/saldo.dart';
import 'package:bytebankms/screens/dashboard/saldo_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          Consumer<Saldo>(
            builder: (context, saldo, child) {
              return RaisedButton(
                child: Text('Adiciona'),
                onPressed: () {
                  saldo.adiciona(10);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
