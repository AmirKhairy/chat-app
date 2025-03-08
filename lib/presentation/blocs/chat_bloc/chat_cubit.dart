import 'dart:developer';

import 'package:chat_app/data/models/message_model.dart';
import 'package:chat_app/data/models/users_model.dart';
import 'package:chat_app/presentation/blocs/chat_bloc/chat_states.dart';
import 'package:chat_app/presentation/views/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);

  List<UsersModel> users = [];

  UsersModel? userModel;

  Future<void> getUsers() async {
    emit(GetUsersLoadingState());
    users.clear();
    FirebaseFirestore.instance.collection('users').snapshots().listen(
      (onData) {
        users.clear();
        onData.docs.forEach((element) {
          if (element.data()['id'] != FirebaseAuth.instance.currentUser!.uid) {
            userModel = UsersModel.fromJson(element.data());
            users.add(userModel!);
          }
          emit(GetUsersSuccessState());
        });
      },
    ).onError((error, stackTrace) {
      emit(GetUsersErrorState(error));
    });
  }
  // Future<void> getUsers() async {
  //   emit(GetUsersLoadingState());
  //   users.clear();
  //   await FirebaseFirestore.instance.collection('users').get().then((onValue) {
  //     onValue.docs.forEach((element) {
  //       if (element.data()['id'] != FirebaseAuth.instance.currentUser!.uid) {
  //         userModel = UsersModel.fromJson(element.data());
  //         users.add(userModel!);
  //       }
  //       emit(GetUsersSuccessState());
  //     });
  //   }).catchError((onError) {
  //     log(onError.toString());
  //     emit(GetUsersErrorState(onError));
  //   });
  // }

  Future<void> sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
  }) async {
    MessageModel messageModel = MessageModel(
      senderId: FirebaseAuth.instance.currentUser!.uid,
      receiverId: receiverId,
      dateTime: dateTime,
      text: text,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(
          messageModel.toMap(),
        )
        .then((onValue) {
      emit(SendMessageSuccessState());
    }).catchError((onError) {
      log(onError.toString());
      emit(SendMessageErrorState());
    });

    await FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('messages')
        .add(
          messageModel.toMap(),
        )
        .then((onValue) {
      emit(RecieveMessageSuccessState());
    }).catchError((onError) {
      log(onError.toString());
      emit(RecieveMessageErrorState());
    });
  }

  List<MessageModel> messages = [];
  void getMesseges({
    required String receiverId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((data) {
      messages = [];
      data.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(GetMessagesSuccessState());
    });
  }
}
