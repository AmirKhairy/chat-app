import 'package:chat_app/presentation/blocs/chat_bloc/chat_cubit.dart';
import 'package:chat_app/presentation/blocs/chat_bloc/chat_states.dart';
import 'package:chat_app/presentation/widgets/users_widgets/no_users_widget.dart';
import 'package:chat_app/presentation/widgets/users_widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ChatCubit.get(context).getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ChatCubit.get(context);

        if (cubit.users.isEmpty) {
          return NoUsersWidget();
        }

        return UsersWidget(cubit: cubit);
      },
    );
  }
}
