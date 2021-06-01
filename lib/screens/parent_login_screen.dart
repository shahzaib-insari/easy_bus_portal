import 'package:EasyBus/loginBody/background.dart';
import 'package:EasyBus/loginBody/body.dart';
import 'package:EasyBus/screens/admin_Login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParentScreen extends StatelessWidget {
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
                  'Parent Login',
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
                  "assets/icons/Male-And-Female.svg",
                  height: size.height * 0.35,
                  //width: size.width,
                ),
                LoginContainer(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        icon: Icon(Icons.format_list_numbered_rtl_rounded),
                        border: InputBorder.none,
                        hintText: 'Student Registration No.'),
                    textInputAction: TextInputAction.next,
                    onChanged: (_) {},
                  ),
                ),
                LoginContainer(
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                        ),
                        suffixIcon: Icon(Icons.visibility),
                        border: InputBorder.none,
                        hintText: 'Console Password'),
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
