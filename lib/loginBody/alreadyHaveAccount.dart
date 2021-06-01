import 'package:flutter/material.dart';

class AlreadyAccount extends StatelessWidget {
  final bool islogin;
  final Function press;

  AlreadyAccount({this.islogin = true, this.press});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          islogin ? "Don't have an authoirty ? " : "Already have an Account ? ",
          style: TextStyle(
            color: Colors.purple[200],
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            islogin ? 'Sign Up' : "Sign In",
            style: TextStyle(
                color: Colors.purple[200], fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
