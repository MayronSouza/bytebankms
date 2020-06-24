// Uma transferência
class Transferencia {
  final double value;
  final String accountNumber;

  Transferencia(this.value, this.accountNumber);

  @override
  String toString() =>
      'Transferencia(value: $value, accountNumber: $accountNumber)';
}