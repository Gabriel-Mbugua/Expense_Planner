import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          Text("No Transactions Added Yet!",
              style: Theme
                  .of(context)
                  .textTheme
                  .title),
          SizedBox(
            height: 20,
          ),
          Container(
              height: constraints.maxHeight * 0.7,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              )),
        ],
      );
    })
        : ListView.builder(
      itemBuilder: (context, index) {
        return TransactionItem(transaction: transactions[index], deleteTx: deleteTx);
      },
      itemCount: transactions.length,
    );
  }
}
