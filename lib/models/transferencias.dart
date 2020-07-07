import 'package:bytebankms/models/transferencia.dart';
import 'package:flutter/material.dart';

class Transaferencias extends ChangeNotifier {
  final List<Transferencia> _transferencias = [];

  List<Transferencia> get transferencias => _transferencias;

  adiciona(Transferencia novaTransferencia) {
    transferencias.add(novaTransferencia);

    notifyListeners();
  }
}
