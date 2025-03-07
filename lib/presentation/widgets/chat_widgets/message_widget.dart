import 'package:chat_app/presentation/blocs/chat_bloc/chat_cubit.dart';
import 'package:chat_app/presentation/widgets/chat_widgets/user_bubble.dart';
import 'package:chat_app/presentation/widgets/chat_widgets/user_friend_bubble.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

class MessagesWidget extends StatelessWidget {
  const MessagesWidget({
    super.key,
    required this.scrollController,
    required this.chatId,
  });

  final ScrollController scrollController;
  final String chatId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ConditionalBuilder(
        condition: ChatCubit.get(context).messages.isNotEmpty,
        builder: (context) {
          return ListView.builder(
            controller: scrollController,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (ChatCubit.get(context).messages[index].senderId == chatId) {
                return UserFriendBubble(
                  mesageModel: ChatCubit.get(context).messages[index],
                );
              }
              return UserBubble(
                messageModel: ChatCubit.get(context).messages[index],
              );
            },
            itemCount: ChatCubit.get(context).messages.length,
          );
        },
        fallback: (context) => Center(
          child: Text(
            'Start Chating',
          ),
        ),
      ),
    );
  }
}
