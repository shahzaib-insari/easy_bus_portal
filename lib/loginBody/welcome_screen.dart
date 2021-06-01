import 'package:EasyBus/loginBody/body.dart';
import 'package:EasyBus/loginBody/chart.dart';
import 'package:EasyBus/providers/transaction.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: 250,
      ),
    );
  }
}
