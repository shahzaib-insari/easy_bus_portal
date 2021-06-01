import 'package:EasyBus/admin/ui/dashboard_screen.dart';
import 'package:EasyBus/providers/auth.dart';

import 'package:EasyBus/screens/all_logins_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
    /* 
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        )
      ],
      child: MaterialApp(
        home: AllLoginScreen(),
        routes: {},
        //AllLoginScreen(),
      ),
    );
    */
  }
}
