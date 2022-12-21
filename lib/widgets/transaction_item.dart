import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _avatarColor;
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.teal,
      Colors.deepPurple,
      Colors.yellow,
      Colors.orange,
      Colors.lightBlue,
      Colors.lightGreen,
      Colors.pink
    ];
    _avatarColor = availableColors[Random().nextInt(7)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _avatarColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                '₹${widget.transaction.amount}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat().format(widget.transaction.date),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline_rounded),
          color: Theme.of(context).errorColor,
          onPressed: () => widget.deleteTx(widget.transaction.id),
        ),
      ),
    );
  }
}
