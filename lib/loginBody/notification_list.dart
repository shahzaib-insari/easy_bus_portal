import 'package:EasyBus/loginBody/notification_item.dart';
import 'package:EasyBus/providers/notification.dart';
import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  final List<Notification_> notification;
  NotificationList(this.notification);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return notification.isEmpty
            ? Column(
                children: [
                  Text('No Notifications yet...'),
                ],
              )
            : ListView(
                children: notification
                    .map(
                      (tx) => NotificationItem(
                        notification: tx,
                      ),
                    )
                    .toList(),
              );
      },
    );
  }
}
