// Uma transferência
class Transferencia {
  final double valor;
  final String numeroConta;

  Transferencia(this.valor, this.numeroConta);

  String toStringValor() {
    return 'R\$ $valor';
  }

  String toStringNumeroConta() {
    return 'Conta: $numeroConta';
  }
}
