import 'package:chat_app/core/utils/constants.dart';
import 'package:chat_app/presentation/blocs/chat_bloc/chat_cubit.dart';
import 'package:flutter/material.dart';

class SendMessageTextFieldWidget extends StatelessWidget {
  const SendMessageTextFieldWidget({
    super.key,
    required this.controller,
    required this.chatId,
    required this.scrollController,
  });

  final TextEditingController controller;
  final String chatId;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: (value) {
        ChatCubit.get(context).sendMessage(
          text: controller.text,
          dateTime: DateTime.now().toString(),
          receiverId: chatId,
        );
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (scrollController.hasClients) {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
            );
          }
        });
        controller.clear();
      },
      keyboardType: TextInputType.multiline,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: 'Send Message',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            ChatCubit.get(context).sendMessage(
              text: controller.text,
              dateTime: DateTime.now().toString(),
              receiverId: chatId,
            );
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (scrollController.hasClients) {
                scrollController.animateTo(
                  scrollController.position.maxScrollExtent,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                );
              }
            });
            controller.clear();
          },
          icon: Icon(
            Icons.send,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
