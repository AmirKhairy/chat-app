import 'package:chat_app/core/utils/constants.dart';
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
            Image.asset(
              'assets/images/scholar.png',
              height: 50,
            ),
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
        child: Text('No Users'),
      ),
    );
  }
}