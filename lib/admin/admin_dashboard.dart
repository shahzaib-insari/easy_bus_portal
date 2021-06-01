import 'package:EasyBus/loginBody/notification_list.dart';
import 'package:EasyBus/providers/notification.dart';
import 'package:EasyBus/screens/admin_Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final List<Notification_> createdNotification = [
    Notification_(noti_message: "holiday tommorow", noti_date: DateTime.now()),
    Notification_(noti_message: "Traffic issues", noti_date: DateTime.now()),
  ];
  bool _showChart = false;
  final textController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  openAlertBox() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 320,
              width: 420,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(
                      0.8, 0.0), // 10% of the width, so there are ten blinds.
                  colors: <Color>[Colors.purple, Colors.blue], // red to yellow
                  tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Rate",
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ]),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.purple,
                    height: 4.0,
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: textController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 8,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type notification'),
                        onSaved: (val) {},
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      height: 60,
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.purple[200],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: Text(
                        "Create Notification",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        backgroundColor: Colors.purple[200],
        actions: [
          IconButton(
            icon: Icon(
              Icons.circle_notifications,
              size: size.width * 0.1,
              color: Colors.deepPurple,
            ),
            onPressed: () => openAlertBox(),
          ),
          //FloatingActionButtonLocation:FloatingActionButtonLocation.endDocked
          // FloatingActionButton(
          //   focusColor: Colors.blue,
          //   child: Text("Buses Location"),
          // ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Show Notification'),
                  Switch(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  )
                ],
              ),
              _showChart
                  ? Container(
                      height: 300,
                      width: 500,
                      child: NotificationList(openAlertBox()),
                    )
                  : Container(
                      child: Card(child: Text("No Notification yet...")),
                    )
            ],
          ),
        ],
      ),
    );
  }
}
