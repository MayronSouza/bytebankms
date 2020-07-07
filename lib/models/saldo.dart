import 'package:flutter/cupertino.dart';

class Saldo extends ChangeNotifier {
  final double valor;

  Saldo(this.valor);

  @override
  String toString() => 'R\$ $valor';
}
