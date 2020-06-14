import 'package:flutter/material.dart';
import './transactions_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [
    Transaction('1', 'First transaction', 25.52, DateTime.now()),
    Transaction('2', 'Second transaction', 854.54, DateTime.now())
  ];

  void addTransaction(String title, double amount){
    final newTransaction = Transaction(DateTime.now().toString(), title, amount, DateTime.now());
    
    setState(() {
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addTransaction), 
        TransactionList(transactions)
      ],
    );
  }
}
