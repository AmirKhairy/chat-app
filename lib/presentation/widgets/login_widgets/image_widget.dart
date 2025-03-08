
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/images/chat__logo.png'),
      height: height,
    );
  }
}
