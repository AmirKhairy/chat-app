import 'package:chat_app/core/utils/components.dart';
import 'package:chat_app/core/utils/constants.dart';
import 'package:chat_app/presentation/blocs/login_bloc/login_cubit.dart';
import 'package:chat_app/presentation/blocs/login_bloc/login_states.dart';
import 'package:chat_app/presentation/widgets/login_widgets/image_widget.dart';
import 'package:chat_app/presentation/widgets/login_widgets/login_or_register_row.dart';
import 'package:chat_app/presentation/widgets/login_widgets/register_bloc_concumer_button.dart';
import 'package:chat_app/presentation/widgets/login_widgets/sub_title_widget.dart';
import 'package:chat_app/presentation/widgets/login_widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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
              ImageWidget(
                height: 100,
              ),
              TitleWidget(title: 'ChitChat'),
              SizedBox(
                height: 60,
              ),
              SubTitleWidget(subTitle: 'Register'),
              SizedBox(
                height: 20,
              ),
              defaultTextFormField(
                controller: nameController,
                type: TextInputType.name,
                validator: (name) {
                  if (name!.isEmpty) {
                    return 'name must not be empty';
                  }
                  return null;
                },
                hintText: 'Name',
                isPassword: false,
                showSuffixIcon: false,
              ),
              SizedBox(
                height: 10,
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
              RegisterBlocConcumerButton(
                  formKey: formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  nameController: nameController),
              SizedBox(
                height: 10,
              ),
              LoginOrRegisterRow(
                text: 'Already have an account? ',
                buttonText: 'Login',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
