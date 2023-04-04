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

  var transactionList = [
    Transaction('Mẹ cho', 30, '08/04/2023'),
    Transaction('Ba cho', 40, '09/04/2023'),
    Transaction('Ăn sáng', -25, '09/04/2023'),
  ];

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
        body: Column(
          children: [
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('${transactionList[0].amount}k'),
                ),
                title: Text(transactionList[0].description),
                subtitle: Text(transactionList[0].date),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('${transactionList[1].amount}k'),
                ),
                title: Text(transactionList[1].description),
                subtitle: Text(transactionList[1].date),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('${transactionList[2].amount}k'),
                ),
                title: Text(transactionList[2].description),
                subtitle: Text(transactionList[2].date),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
