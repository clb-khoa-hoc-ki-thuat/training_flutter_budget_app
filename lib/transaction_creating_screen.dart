import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TransactionCreatingScreen extends StatelessWidget {
  var transaction;

  TransactionCreatingScreen(this.transaction);

  @override
  Widget build(BuildContext context) {
    var amountController = TextEditingController();
    var descriptionController = TextEditingController();
    var dateController = TextEditingController();

    if (transaction != null) {
      amountController.text = transaction.amount.toString();
      dateController.text = transaction.date;
      descriptionController.text = transaction.description;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm thu chi'),
        actions: [
          IconButton(
            onPressed: () {
              var amountText = amountController.text;
              var dateText = dateController.text;
              var descriptionText = descriptionController.text;

              Navigator.of(context).pop({
                'amount': double.parse(amountText),
                'date': dateText,
                'description': descriptionText,
              });
            },
            icon: Icon(
              Icons.check,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('Số tiền'),
          TextField(
            controller: amountController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          Text('Ngày'),
          TextField(
            controller: dateController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          Text('Diễn giải'),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            minLines: 3,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
