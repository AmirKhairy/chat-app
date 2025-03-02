import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  TitleWidget({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 32,
          color: Colors.white,
          fontFamily: 'Pacifico',
        ),
      ),
    );
  }
}
