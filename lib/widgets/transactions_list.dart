import 'package:financeOrganizer/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: transactions.isEmpty
            ? [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text('No transactions avaliable!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Container(
                      margin: EdgeInsets.only(top:50),
                      height: 300,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ]
            : transactions
                .map((item) => Card(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            constraints:
                                BoxConstraints(minWidth: 100, maxWidth: 120),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColorDark,
                                    width: 1.5)),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Text(
                              'R\$ ${item.amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18),
                            )),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                item.title,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                DateFormat('dd/MM/yyyy').format(item.date),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )))
                .toList(),
      ),
    );
  }
}
