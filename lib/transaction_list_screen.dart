import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:training_flutter_budget_app/transaction.dart';

class TransactionListScreen extends StatelessWidget {
  TransactionListScreen({super.key});

  var transactionList = [
    Transaction('Mẹ cho', 30, '08/04/2023'),
    Transaction('Ba cho', 40, '09/04/2023'),
    Transaction('Ăn sáng', -25, '09/04/2023'),
    Transaction('Ăn trưa', -35, '09/04/2023'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget App'),
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
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
