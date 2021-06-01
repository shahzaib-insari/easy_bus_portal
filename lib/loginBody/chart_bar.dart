import 'package:flutter/material.dart';

class Chartbar extends StatelessWidget {
  final String label;

  final double SpendingPercentAmount;

  Chartbar(this.label, this.SpendingPercentAmount);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.6,
              width: constraints.maxHeight * 0.03,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 10),
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: SpendingPercentAmount,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor, // bar color
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(child: FittedBox(child: Text(label))),
          ],
        );
      },
    );
  }
}
