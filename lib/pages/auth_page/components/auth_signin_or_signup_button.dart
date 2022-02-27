import 'package:flutter/material.dart';

class AuthSignInOrSignUpButton extends StatelessWidget {
  final String text;
  final VoidCallback press;

  const AuthSignInOrSignUpButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: press,
      minWidth: 140,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
      color: const Color(0xFF00BF97),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
