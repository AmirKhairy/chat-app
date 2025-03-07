import 'package:chat_app/core/utils/constants.dart';
import 'package:chat_app/presentation/blocs/chat_bloc/chat_cubit.dart';
import 'package:chat_app/presentation/views/login_screen.dart';
import 'package:chat_app/presentation/widgets/users_widgets/user_item_widget.dart';
import 'package:flutter/material.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({
    super.key,
    required this.cubit,
  });

  final ChatCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false,
              );
            },
            icon: Icon(
              Icons.logout,
              color: Colors.red,
            ),
          ),
        ],
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
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => UserItem(
          model: cubit.users[index],
        ),
        separatorBuilder: (context, index) => Divider(
          endIndent: 20,
          indent: 20,
        ),
        itemCount: cubit.users.length,
      ),
    );
  }
}
