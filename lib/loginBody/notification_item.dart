import '../providers/notification.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class NotificationItem extends StatefulWidget {
  // Key:Key;
  final Notification_ notification;
  NotificationItem({this.notification});

  @override
  _NotificationItemState createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  Color _bgColor;
  @override
  void initState() {
    const selectedColor = [
      Colors.blue,
      Colors.pink,
      Colors.purple,
      Colors.cyanAccent
    ];
    _bgColor = selectedColor[Random().nextInt(4)];
    super.initState();
  }

  Widget build(BuildContext context) {
    // use on dismiss to delete from course
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: FittedBox(child: Icon(Icons.notifications_active)),
          ),
        ),
        title: Text('Notification'),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.notification.noti_date),
        ),
      ),
    );
  }
}
