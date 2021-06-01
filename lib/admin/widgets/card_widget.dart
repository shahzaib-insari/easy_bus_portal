import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final colors = <Color>[
    Colors.indigo,
    Colors.blue[800],
    Colors.orange,
    Colors.green
  ];
  final int index;
  CardWidget(this.index);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Color(0xFFE7E7E7),
        child: Card(
          color: Color(0xFFE7E7E7),
          child: Container(
            color: colors[index],
            width: 250,
            height: 140,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.airport_shuttle,
                      color: Colors.white,
                      size: 50,
                    ),
                    Spacer(),
                    Text(
                      '445',
                      style: TextStyle(fontSize: 48, color: Colors.white),
                    ),
                  ],
                ),
                Text('Registered Students',
                    style: TextStyle(fontSize: 18, color: Colors.white))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
