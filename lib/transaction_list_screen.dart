import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:training_flutter_budget_app/transaction.dart';
import 'package:training_flutter_budget_app/transaction_creating_screen.dart';
import 'package:http/http.dart' as http;

class TransactionListScreen extends StatefulWidget {
  TransactionListScreen({super.key});

  @override
  State<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  var transactionList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(
                MaterialPageRoute(
                  builder: (context) => TransactionCreatingScreen(null),
                ),
              )
                  .then((value) {
                var amount = value['amount'];
                var date = value['date'];
                var description = value['description'];

                var url = Uri.parse(
                    'https://training-flutter-budget-app-default-rtdb.asia-southeast1.firebasedatabase.app/transactions.json');

                http
                    .post(
                  url,
                  body: jsonEncode(
                    {
                      'amount': value['amount'],
                      'description': value['description'],
                      'date': value['date'],
                    },
                  ),
                )
                    .then((response) {
                  var data = jsonDecode(response.body) as Map<String, dynamic>;

                  String id = data['name'];

                  var newTransaction = Transaction(
                    id,
                    description,
                    amount,
                    date,
                  );

                  setState(() {
                    transactionList.add(newTransaction);
                  });
                });
              });
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: transactionList
              .map(
                (transaction) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          (transaction.amount > 0) ? Colors.green : Colors.red,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        child: FittedBox(
                          child: Text(
                            '${transaction.amount}k',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(transaction.description),
                    subtitle: Text(transaction.date),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TransactionCreatingScreen(transaction),
                              ),
                            ).then((value) {
                              var updatingTransaction = transactionList
                                  .firstWhere((t) => transaction.id == t.id);

                              setState(() {
                                updatingTransaction.amount = value['amount'];
                                updatingTransaction.date = value['date'];
                                updatingTransaction.description =
                                    value['description'];
                              });
                            });
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.amber,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              transactionList
                                  .removeWhere((t) => transaction.id == t.id);
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
