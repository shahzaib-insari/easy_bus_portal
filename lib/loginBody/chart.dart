import 'package:flutter/material.dart';
import './chart_bar.dart';
import '../providers/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> UpdatedTransaction;
  Chart(this.UpdatedTransaction);

  List<Map<String, Object>> get TransactionChart {
    return List.generate(7, (index) {
      final Weekday = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalSum = 0.0;
      for (var i = 0; i < UpdatedTransaction.length; i++) {
        if (UpdatedTransaction[i].date.day == Weekday.day &&
            UpdatedTransaction[i].date.month == Weekday.month &&
            UpdatedTransaction[i].date.year == Weekday.year) {
          totalSum += UpdatedTransaction[i].price;
        }
      }

      return {
        'day': DateFormat.E().format(Weekday).substring(0, 2),
        'price': totalSum
      };
    }).reversed.toList();
  }

  double get testPercentage {
    return TransactionChart.fold(
      0.0,
      (sum, item) {
        return sum + item['price'];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: TransactionChart.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: Chartbar(
              data['day'],
              testPercentage == 0.0
                  ? 0.0
                  : (data['price'] as double) / testPercentage,
            ),
          );
        }).toList(),
      ),
    );
  }
}
