import 'package:financeOrganizer/models/transaction.dart';
import 'package:financeOrganizer/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;
  Chart(this.transactions);

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var daySum = 0.0;

      for (var i = 0; i < transactions.length; i++) {
        if (transactions[i].date.day == weekDay.day &&
            transactions[i].date.month == weekDay.month &&
            transactions[i].date.year == weekDay.year) {
          daySum += transactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': daySum
      };
    }).reversed.toList();
  }

  double get totalAmount {
    return groupTransactionValues.fold(0, (sum, item) => sum + item['amount']);
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransactionValues);
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ...groupTransactionValues
                  .map((item) => ChartBar(item['day'], item['amount'],
                      (item['amount'] as double) / totalAmount))
                  .toList(),
            ],
          ),
        ));
  }
}
