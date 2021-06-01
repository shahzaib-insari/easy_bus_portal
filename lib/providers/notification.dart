import 'package:flutter/cupertino.dart';

class Notification_ with ChangeNotifier {
  final String noti_message;
  DateTime noti_date;

  Notification_({this.noti_message, this.noti_date});
}
