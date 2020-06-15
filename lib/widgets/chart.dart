import 'package:financeOrganizer/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;
  Chart(this.transactions);

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var daySum = 0.0;

      for(var i = 0 ; i < transactions.length ; i++) {
        if(transactions[i].date.day == weekDay.day && 
           transactions[i].date.month == weekDay.month &&
           transactions[i].date.year == weekDay.year){
             daySum += transactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0,2),
        'amount': daySum
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransactionValues);
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[],
            )
          ],
        ));
  }
}
