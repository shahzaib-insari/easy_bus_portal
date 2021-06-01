import 'package:flutter/material.dart';

class TopEmployees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 450,
        width: 380,
        child: Column(
          children: [
            Text(
              "Top Employees",
              style: TextStyle(
                  fontSize: 18,
                  backgroundColor: Color.fromRGBO(0, 84, 166, 1),
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
