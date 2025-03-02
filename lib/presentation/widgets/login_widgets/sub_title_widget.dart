import 'package:flutter/material.dart';

class SubTitleWidget extends StatelessWidget {
   SubTitleWidget({super.key, required this.subTitle});
  String subTitle;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        subTitle,
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
