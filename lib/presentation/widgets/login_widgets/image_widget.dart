import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/images/scholar.png'),
      height: 100,
    );
  }
}
