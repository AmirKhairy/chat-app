import 'package:chat_app/core/utils/components.dart';
import 'package:chat_app/core/utils/constants.dart';
import 'package:chat_app/presentation/blocs/login_bloc/login_cubit.dart';
import 'package:chat_app/presentation/blocs/login_bloc/login_states.dart';
import 'package:chat_app/presentation/views/chat_screen.dart';
import 'package:chat_app/presentation/views/register_screen.dart';
import 'package:chat_app/presentation/views/users_screen.dart';
import 'package:chat_app/presentation/widgets/login_widgets/image_widget.dart';
import 'package:chat_app/presentation/widgets/login_widgets/login_or_register_row.dart';
import 'package:chat_app/presentation/widgets/login_widgets/sub_title_widget.dart';
import 'package:chat_app/presentation/widgets/login_widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          key: formKey,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ImageWidget(),
              TitleWidget(
                title: 'Scholar Chat',
              ),
              SizedBox(
                height: 60,
              ),
              SubTitleWidget(
                subTitle: 'Login',
              ),
              SizedBox(
                height: 20,
              ),
              defaultTextFormField(
                controller: emailController,
                type: TextInputType.emailAddress,
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'email must not be empty';
                  }
                  return null;
                },
                hintText: 'Email',
                isPassword: false,
                showSuffixIcon: false,
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<LoginCubit, LoginStates>(
                builder: (context, state) => defaultTextFormField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  validator: (password) {
                    if (password!.isEmpty) {
                      return 'password must not be empty';
                    }
                    return null;
                  },
                  hintText: 'Password',
                  isPassword: LoginCubit.get(context).isPassword,
                  suffixIcon: LoginCubit.get(context).isPassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  suffixPressed: () {
                    LoginCubit.get(context).changePasswordEye();
                  },
                  showSuffixIcon: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BlocConsumer<LoginCubit, LoginStates>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UsersScreen(),
                      ),
                      (route) => false,
                    );
                  }
                  if (state is LoginErrorState) {
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
                      LoginCubit.get(context).login(
                        emailAddress: emailController.text,
                        password: passwordController.text,
                      );
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              LoginOrRegisterRow(
                text: 'Don\'t have an account? ',
                buttonText: 'Sign Up',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
