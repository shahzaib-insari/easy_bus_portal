import 'package:EasyBus/loginBody/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Transaction with ChangeNotifier {
  // List<Transaction> _transaction = [];
  final String id;

  final double price;
  DateTime date;

  Transaction({this.id, this.price, this.date});

  // Future<void> transactionToDB(Transaction trans) async {
  //   try {
  //     final url =
  //         'https://authentication-16dfc-default-rtdb.firebaseio.com/transaction.json';
  //     final response = http.post(url,
  //         body: json.encode({
  //           'id': 123,
  //           'price': trans.price,
  //           'date': trans.date,
  //         }));

  //     final my_new_Transaction =
  //         Transaction(id: trans.id, price: 150, date: trans.date);
  //     _transaction.add(my_new_Transaction);
  //     notifyListeners();
  //   } catch (error) {
  //     throw error;
  //   }
  // }
}
