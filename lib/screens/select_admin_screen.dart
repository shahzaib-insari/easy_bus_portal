import 'package:EasyBus/screens/admin_Login_screen.dart';
import 'package:EasyBus/screens/all_logins_screen.dart';
import 'package:EasyBus/screens/super_admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectAdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.purple,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Admin Level Selection",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SvgPicture.asset(
                'assets\icons\Prismatic.svg',
                height: 50,
                width: 50,
              ),
              AllLoginScreen().loginsButton(
                "Super",
                '',
                () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SuperAdminScreen();
                  }));
                },
              ),
              SizedBox(
                height: 20,
              ),
              AllLoginScreen().loginsButton(
                "Junior",
                '',
                () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return AdminLoginScreen();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
