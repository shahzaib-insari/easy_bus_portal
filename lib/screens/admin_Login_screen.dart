import 'package:EasyBus/loginBody/alreadyHaveAccount.dart';
import 'package:EasyBus/loginBody/background.dart';
import 'package:EasyBus/loginBody/body.dart';
import 'package:EasyBus/providers/auth.dart';
import 'package:EasyBus/screens/admin_signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AdminLoginScreen extends StatefulWidget {
  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  void showDailog(String meassage) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error Message'),
        content: Text(meassage),
        actions: [
          FlatButton(
            child: Text("okay"),
            onPressed: () => Navigator.of(ctx).pop(),
          )
        ],
      ),
    );
  }

  var _isLoading = false;
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  Future<void> _submit() async {
    try {
      if (!_formKey.currentState.validate()) {
        // Invalid!
        return;
      }
      _formKey.currentState.save();
      setState(() {
        _isLoading = true;
      });

      await Provider.of<Auth>(context, listen: false)
          .signup(_authData['email'], _authData['password']);
    } on Exception catch (error) {
      showDailog(error.toString());
    } catch (error) {
      showDailog(error.toString());
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: background(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login', // must be fixed later on top
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
                  width: size.width * 0.45,
                ),
                LoginContainer(
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                        ),
                        border: InputBorder.none,
                        hintText: 'Your Email'),
                    onSaved: (val) {
                      _authData['email'] = val;
                    },
                  ),
                ),
                LoginContainer(
                  child: TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                        ),
                        suffixIcon: Icon(Icons.visibility),
                        border: InputBorder.none,
                        hintText: 'Password'),
                    onSaved: (val) {
                      _authData['password'] = val;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                if (_isLoading) CircularProgressIndicator(),
                Body().roundedButton('Login', () {
                  _submit();
                }, Colors.purple, Colors.white, size),
                AlreadyAccount(press: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return AdminSignScreen();
                  }));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginContainer extends StatelessWidget {
  final Widget child;
  const LoginContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.purple[100]),
      child: child,
    );
  }
}
