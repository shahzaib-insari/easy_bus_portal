import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({
    Key key,
    this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: size,
        color: const Color(0xFF2C3C56),
        child: ListView(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 10),
                margin: const EdgeInsets.only(top: 30, bottom: 15),
                child: Text('Menu',
                    style: TextStyle(
                      color: Colors.white54,
                    ))),
            _tile('Create Notification'),
            _tile('Registration Requests'),
            _tile('Rescue Vehicle'),
            _tile('View Reports'),
            _tile('Manage Routes'),
            Container(
                padding: const EdgeInsets.only(left: 10),
                margin: const EdgeInsets.only(top: 30, bottom: 15),
                child: Text('Manage Users',
                    style: TextStyle(
                      color: Colors.white54,
                    ))),
            _tile('Admins'),
            _tile('Drivers'),
            _tile('Students'),
            _tile('Buses'),
          ],
        ),
      ),
    );
  }

  Widget _tile(String label) {
    return Column(
      children: [
        ListTile(
          title: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {},
        ),
        Divider()
      ],
    );
  }
}
