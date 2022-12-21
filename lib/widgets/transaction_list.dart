import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'No transactions added yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 20),
              Container(
                height: 150,
                child: Image.asset(
                  'images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
              key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTx,
                    ))
                .toList());
  }
}
