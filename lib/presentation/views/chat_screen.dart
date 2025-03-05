import 'package:chat_app/core/utils/constants.dart';
import 'package:chat_app/data/models/message_model.dart';
import 'package:chat_app/data/models/users_model.dart';
import 'package:chat_app/presentation/blocs/chat_bloc/chat_cubit.dart';
import 'package:chat_app/presentation/blocs/chat_bloc/chat_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.chatId});
  final String chatId;
  TextEditingController controller = TextEditingController();
  final scrollController = ScrollController(
      initialScrollOffset: BouncingScrollSimulation.maxSpringTransferVelocity);
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        ChatCubit.get(context).getMesseges(receiverId: chatId);

        return BlocConsumer<ChatCubit, ChatStates>(
          listener: (context, state) {},
          builder: (context, state) {
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
                      'Chat',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ConditionalBuilder(
                        condition: ChatCubit.get(context).messages.isNotEmpty,
                        builder: (context) {
                          return ListView.builder(
                            controller: scrollController,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (ChatCubit.get(context)
                                      .messages[index]
                                      .senderId ==
                                  chatId) {
                                return UserFriendBubble(
                                  model: ChatCubit.get(context).messages[index],
                                );
                              }
                              return UserBubble(
                                messageModel:
                                    ChatCubit.get(context).messages[index],
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
                    ),
                    TextFormField(
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
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class UserBubble extends StatelessWidget {
  const UserBubble({
    super.key,
    required this.messageModel,
  });
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(10),
                topEnd: Radius.circular(10),
                bottomEnd: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                messageModel.text!,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            messageModel.dateTime!,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class UserFriendBubble extends StatelessWidget {
  const UserFriendBubble({
    super.key,
    required this.model,
  });

  final MessageModel model;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xff97aec7),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(10),
            topEnd: Radius.circular(10),
            bottomStart: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            model.text!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
