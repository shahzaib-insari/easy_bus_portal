import 'package:flutter/material.dart';
import '../model/dummy_data.dart';
import '../widgets/detailPage.dart';

class ManageAdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = adminList;
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(data[index].name),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      data[index].picture + data[index].toString() + ".jpg"),
                ),
                subtitle: Text(data[index].email),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => DetailPage(data[index])));
                },
              );
            }),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
