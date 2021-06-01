import 'package:EasyBus/screens/driver_login_screen.dart';
import 'package:EasyBus/screens/parent_login_screen.dart';
import 'package:EasyBus/screens/select_admin_screen.dart';
import 'package:EasyBus/screens/student_login_screem.dart';
import 'package:EasyBus/student/dashboard.dart';
import 'package:flutter/material.dart';

class AllLoginScreen extends StatelessWidget {
  Widget loginsButton(String text, String shape, Function press) {
    return Row(
      children: [
        Center(
          child: InkWell(
            onTap: press,
            child: Container(
              // height: 50,
              width: 200,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(
                        0.0,
                        10.0,
                      ),
                      blurRadius: 30,
                      color: Colors.purple[100]),
                ],
                color: Colors.deepPurple[250], // cahnge to 200 to see changes
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 155,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                    child: Text(
                      text,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic),
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.blue,
                          Colors.purple,
                        ],
                      ),
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        bottomLeft: Radius.circular(70),
                        bottomRight: Radius.circular(300),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.ac_unit,
                    size: 35,
                    color: Color.fromRGBO(102, 102, 255, 0.8),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/Travel-BUS-LED.jpg',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login As",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                thickness: 2,
                color: Color.fromRGBO(102, 102, 255, 0.7),
              ),
              SizedBox(
                height: 70,
              ),
              loginsButton(
                'Admin',
                '',
                () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SelectAdminScreen();
                  }));
                },
              ),
              SizedBox(
                height: 50,
              ),
              loginsButton(
                'Student',
                '',
                () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return StudentLoginScreen();
                  }));
                },
              ),
              SizedBox(
                height: 50,
              ),
              loginsButton(
                'Parent',
                '',
                () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ParentScreen();
                  }));
                },
              ),
              SizedBox(
                height: 50,
              ),
              loginsButton(
                'Driver',
                '',
                () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return DriverScreen();
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
