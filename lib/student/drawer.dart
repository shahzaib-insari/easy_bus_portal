import 'package:EasyBus/student/view_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaction.dart';

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Manage'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: (Text('View Profile')),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ViewProfile();
              }));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.scatter_plot_rounded),
            onTap: () {},
            title: (Text('Scan')),

            //Navigator.of(context).pushReplacementNamed(OrderScreen.route),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.home_rounded,
            ),
            onTap: () {},
            title: (Text('Dashboard')),

            //   Navigator.of(context).pushReplacementNamed(UserProductScreen.route),
          )
        ],
      ),
    );
  }
}
