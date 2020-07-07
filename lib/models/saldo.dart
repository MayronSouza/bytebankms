import 'package:flutter/cupertino.dart';

class Saldo extends ChangeNotifier {
  double valor;

  Saldo(this.valor);

  void adiciona(double valor) {
    this.valor += valor;
  }

  @override
  String toString() => 'R\$ $valor';
}
