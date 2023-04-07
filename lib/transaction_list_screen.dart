import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:training_flutter_budget_app/transaction.dart';
import 'package:training_flutter_budget_app/transaction_creating_screen.dart';

class TransactionListScreen extends StatefulWidget {
  TransactionListScreen({super.key});

  @override
  State<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  var transactionList = [
    Transaction(1, 'Mẹ cho', 30, '08/04/2023'),
    Transaction(2, 'Ba cho', 40, '09/04/2023'),
    Transaction(3, 'Ăn sáng', -25, '09/04/2023'),
    Transaction(4, 'Ăn trưa', -35, '09/04/2023'),
  ];

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
                  builder: (context) => TransactionCreatingScreen(),
                ),
              )
                  .then((value) {
                var id = transactionList[transactionList.length - 1].id + 1;
                var amount = value['amount'];
                var date = value['date'];
                var description = value['description'];

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
                    trailing: IconButton(
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
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
