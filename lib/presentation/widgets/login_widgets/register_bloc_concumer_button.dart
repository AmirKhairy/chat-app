import 'package:chat_app/core/utils/components.dart';
import 'package:chat_app/presentation/blocs/login_bloc/login_cubit.dart';
import 'package:chat_app/presentation/blocs/login_bloc/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBlocConcumerButton extends StatelessWidget {
  const RegisterBlocConcumerButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Registered Successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        }
        if (state is RegisterErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) => defaultButton(
        function: () {
          if (formKey.currentState!.validate()) {
            LoginCubit.get(context).register(
              emailAddress: emailController.text,
              password: passwordController.text,
              name: nameController.text,
            );
          }
        },
        child: state is RegisterLoadingState
            ? CircularProgressIndicator(
                color: Colors.black,
              )
            : Text(
                'Register',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}
