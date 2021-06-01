import 'package:EasyBus/screens/admin_Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:EasyBus/screens/admin_signup_screen.dart';
import '../loginBody/background.dart';

class Body extends StatelessWidget {
  Widget roundedButton(
      String text, Function press, Color color, Color textColor, Size size) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      width: size.width * 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          onPressed: press,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Admin '),
          SvgPicture.asset(
            'assets/icons/bus-purple.svg',
            height: size.height * 0.4,
          ),
          roundedButton('login', () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return AdminLoginScreen();
                },
              ),
            );
          }, Colors.purple, Colors.white, size),
          roundedButton('Sign up', () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return AdminSignScreen();
            }));
          }, Colors.purpleAccent, Colors.white, size),
        ],
      ),
    );
  }
}
