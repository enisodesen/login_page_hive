import 'package:flutter/material.dart';

class LoginAndSignupButton extends StatelessWidget {
  const LoginAndSignupButton({
    Key? key,
    required this.buttonBackgroundColor,
    required this.alertText,
    required this.alertContext,
    required this.onClick,
  }) : super(key: key);

  final void Function() onClick;
  final Color buttonBackgroundColor;
  final String alertText;
  final String alertContext;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonBackgroundColor,
            shape: const StadiumBorder()),
        onPressed: () {
          onClick();
        },
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'LOGIN',
            style: TextStyle(fontSize: 22),
          ),
        ));
  }
}
