import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function tx;

  NewTransaction(this.tx);
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  DateTime _submitDate;
  void sumbit_Action() {
    if (priceController.text.isEmpty) {
      return;
    }
    final enterNameController = nameController.text;
    final enterPriceController = double.parse(priceController.text);
    if (enterNameController.isEmpty ||
        enterPriceController <= 0 ||
        _submitDate == null) {
      return;
    }
    widget.tx(enterNameController, enterPriceController, _submitDate);
    Navigator.of(context).pop();
  }

  void _DateClickedFunction() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 12, 8),
      lastDate: DateTime.now(),
    ).then((pickDate) {
      if (pickDate == null) {
        return;
      }
      setState(() {
        _submitDate = pickDate;
      });
    });
  }

  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Product Type',
              ),
              onSubmitted: (_) => sumbit_Action(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              controller: priceController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => sumbit_Action(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _submitDate == null
                          ? 'No Date Chosen!!!'
                          : 'Selected Data: ${DateFormat.yMEd().format(_submitDate)}',
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: _DateClickedFunction,
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              color: Colors.lightBlueAccent,
              textColor: Colors.red.shade50,
              onPressed: () {
                sumbit_Action();
              },
            )
          ],
        ),
      ),
    );
  }
}
