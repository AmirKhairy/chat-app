import 'package:flutter/material.dart';

class LoginOrRegisterRow extends StatelessWidget {
  LoginOrRegisterRow({super.key, required this.text, required this.buttonText, this.onTap});
  VoidCallback? onTap;
  String text;
  String buttonText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Color(0xff97aec7),
            ),
          ),
        ),
      ],
    );
  }
}
