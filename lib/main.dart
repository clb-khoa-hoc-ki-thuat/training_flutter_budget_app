import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Transaction {
  String description;
  double amount;
  String date;

  Transaction(this.description, this.amount, this.date);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var transaction = Transaction('Ăn sáng', 30, '08/04/2023');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Budget App'),
        ),
        body: Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text('${transaction.amount}k'),
            ),
            title: Text(transaction.description),
            subtitle: Text(transaction.date),
          ),
        ),
      ),
    );
  }
}
