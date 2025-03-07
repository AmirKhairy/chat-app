import 'package:chat_app/core/utils/constants.dart';
import 'package:chat_app/data/models/users_model.dart';
import 'package:chat_app/presentation/views/chat_screen.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final UsersModel model;

  const UserItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
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
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                    'assets/images/person_image.jpeg',
                  ),
                ),
              ),
              Text(
                model.name ?? 'Unknown',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}