import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              child: Text('30k'),
            ),
            title: Text('Mẹ cho'),
            subtitle: Text('08/04/2023'),
          ),
        ),
      ),
    );
  }
}
