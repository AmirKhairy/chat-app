import 'dart:developer';

import 'package:chat_app/core/utils/constants.dart';
import 'package:chat_app/data/models/users_model.dart';
import 'package:chat_app/presentation/blocs/chat_bloc/chat_cubit.dart';
import 'package:chat_app/presentation/blocs/chat_bloc/chat_states.dart';
import 'package:chat_app/presentation/views/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ChatCubit.get(context);

        if (cubit.users.isEmpty) {
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
          body: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => UserItem(
              model: cubit.users[index], // Use users list instead of userModel
            ),
            separatorBuilder: (context, index) => Divider(
              endIndent: 20,
              indent: 20,
            ),
            itemCount: cubit.users.length,
          ),
        );
      },
    );
  }
}

class UserItem extends StatelessWidget {
  final UsersModel model;

  const UserItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log(model.id.toString());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              chatId: model.id!,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              model.email ?? 'Unknown',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
