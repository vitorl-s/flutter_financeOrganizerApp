import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();
  final Function addTransaction;
  NewTransaction(this.addTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
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
                onPressed: () => addTransaction(titleInput.text, double.parse(amountInput.text)),
                child: Text(
                  'Add Transaction',
                ),
                textColor: Colors.purple,
              )
            ],
          )),
    );
  }
}
