import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:EasyBus/providers/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transactions,
    @required this.DeleteTx,
  }) : super(key: key);

  final Transaction transactions;
  final Function DeleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;
  @override
  void initState() {
    const selectedColor = [
      Colors.blue,
      Colors.pink,
      Colors.purple,
      Colors.cyanAccent
    ];
    _bgColor = selectedColor[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final url = Uri.parse(
        'https://authentication-16dfc-default-rtdb.firebaseio.com/transaction.json');

    final response = http.post(url,
        body: json.encode({
          'id': widget.transactions.id,
          'price': widget.transactions.price,
          'date': widget.transactions.date.toString(),
        }));
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: FittedBox(
              child: Text(
                '\$${widget.transactions.price}',
                style: TextStyle(color: Colors.yellow),
              ),
            ),
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transactions.date),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () {
            widget.DeleteTx(widget.transactions.id);
          },
        ),
      ),
    );
  }
}
