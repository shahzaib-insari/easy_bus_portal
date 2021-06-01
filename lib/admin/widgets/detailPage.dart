import 'package:flutter/material.dart';
import '../model/admin.dart';

class DetailPage extends StatelessWidget {
  final Admin user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Container(
        child: Center(
          child: Text(this.user.email),
        ),
      ),
    );
  }
}
