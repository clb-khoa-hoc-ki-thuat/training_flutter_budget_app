import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TransactionCreatingScreen extends StatelessWidget {
  const TransactionCreatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm thu chi'),
      ),
      body: Text('Trang thêm thu chi'),
    );
  }
}
