import 'package:chat_app/core/services/shared_prefs/cache_helper.dart';
import 'package:chat_app/core/utils/bloc_observer.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/presentation/blocs/chat_bloc/chat_cubit.dart';
import 'package:chat_app/presentation/blocs/login_bloc/login_cubit.dart';
import 'package:chat_app/presentation/views/login_screen.dart';
import 'package:chat_app/presentation/views/on_boarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();

  bool hasSeenOnboarding = CacheHelper.getBool(key: 'seenOnboarding') ?? false;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MyApp(
        hasSeenOnboarding: hasSeenOnboarding,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;
  const MyApp({super.key, required this.hasSeenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: hasSeenOnboarding ? LoginScreen() : OnBoarding(),
    );
  }
}
