import 'package:bytebankms/models/saldo.dart';
import 'package:bytebankms/models/transferencias.dart';
import 'package:bytebankms/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Saldo(0),
          ),
          ChangeNotifierProvider(
            create: (context) => Transaferencias(),
          )
        ],
        child: BytebankApp(),
      ),
    );

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple[900],
        accentColor: Colors.purple[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.purple[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
