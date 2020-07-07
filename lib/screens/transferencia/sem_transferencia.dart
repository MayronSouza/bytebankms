import 'package:flutter/material.dart';

class SemTransferenciaCadastrada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          'Você ainda não cadastrou nenhuma transferência',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
