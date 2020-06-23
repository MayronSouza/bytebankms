import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple[900],
        accentColor: Colors.purple[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.purple[900],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: ListaTransferencias(),
    );
  }
}

// Formulário de Transferência
class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _numeroContaController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Tranferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _numeroContaController,
                rotulo: 'Numedo da Conta',
                dica: '0000'),
            Editor(
              controlador: _valorController,
              rotulo: 'Valor',
              dica: '0.00',
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(
                'Confirmar',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              onPressed: () {
                criarTranferencia(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void criarTranferencia(BuildContext context) {
    final String numeroConta = this._numeroContaController.text;
    final double valor = double.tryParse(this._valorController.text);

    if (numeroConta != null && valor != null) {
      final _transferenciaCriada = Transferencia(valor, numeroConta);

      debugPrint('Criando Transferência');
      debugPrint('$_transferenciaCriada');
      Navigator.pop(context, _transferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  const Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
    );
  }
}

// Lista as tranferências
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
          'Tranferências',
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
          final Future<Transferencia> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          );
          future.then((transferencia) {
            debugPrint('Tranferência recebido');
            debugPrint('$transferencia');

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

// Cada item da lista de tranferências
class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._transferencia.value.toString()),
        subtitle: Text(this._transferencia.accountNumber),
      ),
    );
  }
}

// Uma transferência
class Transferencia {
  final double value;
  final String accountNumber;

  Transferencia(this.value, this.accountNumber);

  @override
  String toString() =>
      'Transferencia(value: $value, accountNumber: $accountNumber)';
}
