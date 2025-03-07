import 'package:chat_app/core/utils/constants.dart';
import 'package:chat_app/presentation/blocs/chat_bloc/chat_cubit.dart';
import 'package:chat_app/presentation/blocs/chat_bloc/chat_states.dart';
import 'package:chat_app/presentation/widgets/chat_widgets/message_widget.dart';
import 'package:chat_app/presentation/widgets/chat_widgets/send_message_text_field_widget.dart';
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
                      'assets/images/chat_logo.png',
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
                    MessagesWidget(
                        scrollController: scrollController, chatId: chatId),
                    SendMessageTextFieldWidget(
                        controller: controller,
                        chatId: chatId,
                        scrollController: scrollController),
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
