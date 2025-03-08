import 'package:chat_app/core/utils/constants.dart';
import 'package:chat_app/presentation/widgets/login_widgets/image_widget.dart';
import 'package:flutter/material.dart';

class NoUsersWidget extends StatelessWidget {
  const NoUsersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageWidget(height: 50),
            Text(
              'Users',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'There is no users yet',
          style: TextStyle(fontSize: 24, color: kPrimaryColor),
        ),
      ),
    );
  }
}
