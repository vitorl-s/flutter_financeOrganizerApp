import 'package:financeOrganizer/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(child:             Column(
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
            ),);
  }
}
