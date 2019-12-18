import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'dart:math';


class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  Color _bgColor;

  @override
  void initState() {
    const availableColors = [Colors.blue, Colors.purple, Colors.yellow, Colors.red];

    _bgColor = availableColors[Random().nextInt(4)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text('\$${widget.transaction.amount}')),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme
              .of(context)
              .textTheme
              .title,
        ),
        subtitle: Text(
            DateFormat.yMMMd().format(widget.transaction.date)),
        trailing: MediaQuery.of(context).size.width > 400
            ?FlatButton.icon(
            onPressed: () {
              widget.deleteTx(widget.transaction.id);
            },
            icon: const Icon(Icons.delete),
            textColor: Theme.of(context).errorColor,
            label: const Text("Delete"))

            :IconButton(
            icon: const Icon(Icons.delete),
            color: Theme
                .of(context)
                .errorColor,
            onPressed: () {
              widget.deleteTx(widget.transaction.id);
            }),
      ),
    );
  }
}
