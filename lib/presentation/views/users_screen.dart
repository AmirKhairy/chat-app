import 'package:chat_app/core/utils/components.dart';
import 'package:chat_app/presentation/blocs/chat_bloc/chat_cubit.dart';
import 'package:chat_app/presentation/blocs/chat_bloc/chat_states.dart';
import 'package:chat_app/presentation/widgets/users_widgets/no_users_widget.dart';
import 'package:chat_app/presentation/widgets/users_widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      ChatCubit.get(context).getUsers();
      return BlocConsumer<ChatCubit, ChatStates>(
        listener: (context, state) {
          if (state is NoInternetState) {
            showNoInternetDialog(context);
          }
        },
        builder: (context, state) {
          var cubit = ChatCubit.get(context);

          if (cubit.users.isEmpty) {
            return NoUsersWidget();
          }

          return UsersWidget(cubit: cubit);
        },
      );
    });
  }
}
