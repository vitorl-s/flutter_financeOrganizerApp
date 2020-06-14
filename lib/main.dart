import './models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction('1', 'First transaction', 25.52, DateTime.now()),
    Transaction('2', 'Second Transaction', 854.54, DateTime.now())
  ];
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App bar'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
                color: Colors.blue[100],
                child: Container(width: 200, child: Text('Chart'))),
            Card(
                elevation: 3,
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleInput,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountInput,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Add Transaction',
                      ),
                      textColor: Colors.purple,
                    )
                  ],
                )),
            Column(
              children: transactions
                  .map((item) => Card(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              constraints:
                                  BoxConstraints(minWidth: 100, maxWidth: 120),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.purple, width: 1.5)),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Text(
                                'R\$ ${item.amount}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple,
                                    fontSize: 18),
                              )),
                          Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  item.title,
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  DateFormat('dd/MM/yyyy').format(item.date),
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 10,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )))
                  .toList(),
            )
          ],
        ));
  }
}
