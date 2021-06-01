import 'package:EasyBus/loginBody/background.dart';
import 'package:EasyBus/loginBody/body.dart';
import 'package:EasyBus/screens/admin_Login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DriverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: background(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Driver Login',
                  style: TextStyle(
                      color: Color.fromRGBO(102, 102, 255, 0.8),
                      fontSize: 26,
                      fontWeight: FontWeight.w500),
                ),
                Divider(
                  color: Color.fromRGBO(102, 102, 255, 0.3),
                  thickness: 2,
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                SvgPicture.asset(
                  "assets/icons/Prismatic.svg",
                  height: size.height * 0.35,
                  //width: size.width,
                ),
                LoginContainer(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: Icon(Icons.format_list_numbered_rounded),
                        border: InputBorder.none,
                        hintText: 'Bus number e.g 13'),
                    onChanged: (_) {},
                  ),
                ),
                LoginContainer(
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                        ),
                        border: InputBorder.none,
                        hintText: 'Driver Name'),
                    onChanged: (_) {},
                  ),
                ),
                Body().roundedButton(
                    'Next', () {}, Colors.purple, Colors.white, size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
