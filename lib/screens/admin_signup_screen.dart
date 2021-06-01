import 'package:EasyBus/loginBody/alreadyHaveAccount.dart';
import 'package:EasyBus/loginBody/background.dart';
import 'package:EasyBus/screens/admin_Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:EasyBus/loginBody/body.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminSignScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: background(
        //margin: EdgeInsets.only(bottom: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              Text(
                'Sign Up',
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
                "assets/icons/bus-purple.svg",
                width: size.width * 0.5,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue,
                      Colors.purple,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: size.height * 0.4,
                child: SingleChildScrollView(
                  child: Container(
                    //margin: EdgeInsets.only(bottom: 5),
                    child: Column(
                      children: [
                        LoginContainer(
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                ),
                                border: InputBorder.none,
                                hintText: 'Your Email'),
                            onChanged: (_) {},
                          ),
                        ),
                        LoginContainer(
                          child: TextField(
                            obscureText: true,
                            textInputAction: TextInputAction.next,
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
                        DropdownButtonHideUnderline(
                          child: LoginContainer(
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.lock,
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'University ID'),
                              onChanged: (_) {},
                            ),
                          ),
                        ),
                        LoginContainer(
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                ),
                                border: InputBorder.none,
                                hintText: 'Department'),
                            onChanged: (_) {},
                          ),
                        ),
                        LoginContainer(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                ),
                                border: InputBorder.none,
                                hintText: 'Contact Number'),
                            onChanged: (_) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Body().roundedButton(
                  'Sign Up', () {}, Colors.purple, Colors.white, size),
              AlreadyAccount(
                  islogin: false,
                  press: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return AdminLoginScreen();
                        },
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
