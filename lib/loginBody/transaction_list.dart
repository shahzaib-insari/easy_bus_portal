import 'package:flutter/material.dart';
import '../providers/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget with ChangeNotifier {
  final List<Transaction> transaction;
  final Function DeleteTx;
  TransactionList(this.transaction, this.DeleteTx);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return transaction.isEmpty
            ? Column(
                children: [
                  Text('No transaction yet...'),
                ],
              )
            : ListView(
                children: transaction
                    .map(
                      (tx) => TransactionItem(
                          key: ValueKey(tx.id),
                          transactions: tx,
                          DeleteTx: DeleteTx),
                    )
                    .toList(),
              );
      },
    );
  }
}
