import 'dart:developer';

import 'package:chat_app/data/models/users_model.dart';
import 'package:chat_app/presentation/blocs/chat_bloc/chat_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);

  List<UsersModel> users = [];

  UsersModel? userModel;
  Future<void> getUsers() async {
    try {
      emit(GetUsersLoadingState());

      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      users.clear(); 
      users = querySnapshot.docs
          .map((doc) => UsersModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      emit(GetUsersSuccessState());
    } catch (error) {
      log(error.toString());
      emit(GetUsersErrorState(error.toString()));
    }
  }
}
