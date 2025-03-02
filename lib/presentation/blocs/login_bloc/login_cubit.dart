import 'dart:developer';

import 'package:chat_app/presentation/blocs/login_bloc/login_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  void changePasswordEye() {
    isPassword = !isPassword;
    emit(ChangePasswordEyeState());
  }

  Future<void> register({
    required String emailAddress,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      emit(RegisterSuccessState(credential.user!));
    } on FirebaseAuthException catch (e) {
      emit(RegisterErrorState(e.code));
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> login({
    required String emailAddress,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      emit(LoginSuccessState(credential.user!));
    } on FirebaseAuthException catch (e) {
      emit(LoginErrorState(e.code));
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
  }
}
