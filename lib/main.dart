import 'package:financeOrganizer/widgets/chart.dart';
import 'package:financeOrganizer/widgets/transactions_list.dart';

import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transactions_list.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financer Organizer',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction('1', 'First transaction', 25.52, DateTime.now()),
    Transaction('2', 'Second transaction', 84.54, DateTime.now())
  ];

  void addTransaction(String title, double amount) {
    final newTransaction =
        Transaction(DateTime.now().toString(), title, amount, DateTime.now());

    setState(() {
      transactions.add(newTransaction);
    });
  }

  void handleShowBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) {
          return NewTransaction(addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App bar'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => handleShowBottomSheet(context))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => handleShowBottomSheet(context),
            child: Icon(Icons.add)),
        body: ListView(
          children: <Widget>[
            Chart(transactions),
            TransactionList(transactions),
          ],
        ));
  }
}
