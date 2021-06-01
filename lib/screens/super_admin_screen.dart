import '../loginBody/background.dart';
import '../loginBody/body.dart';
import '../screens/admin_Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuperAdminScreen extends StatelessWidget {
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
                  'Super Admin Login',
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
                  "assets/icons/super-admin.svg",
                  height: size.height * 0.45,
                  //width: size.width,
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
                        hintText: 'Password'),
                    onChanged: (_) {},
                  ),
                ),
                Body().roundedButton(
                    'Login', () {}, Colors.purple, Colors.white, size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
