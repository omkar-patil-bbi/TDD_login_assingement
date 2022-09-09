import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/login/presentation/bloc/app_bloc.dart';
import 'feature/login/presentation/pages/home_screen.dart';
import 'feature/login/presentation/pages/log_in_screen.dart';
import 'feature/login/presentation/pages/register_screen.dart';
import 'feature/login/presentation/pages/register_succesfull_screen.dart';
import 'feature/login/presentation/pages/welcome_screen.dart';
// import 'feature/presentation/bloc/app_bloc.dart';
// import 'feature/presentation/pages/home_screen.dart';
// import 'feature/presentation/pages/register_succesfull_screen.dart';
// import 'feature/presentation/pages/register_screen.dart';
// import 'feature/presentation/pages/register_screen.dart';
// import 'feature/presentation/pages/log_in_screen.dart';
// import 'feature/presentation/pages/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => AppBloc(),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if (state is AppInitial) {
              Future.delayed(const Duration(seconds: 3)).then((value) {
                BlocProvider.of<AppBloc>(context).loadWelcomeLogin();
              });
            } else if (state is WelcomeState) {
              return const WelcomePage(
                title: 'Welcome',
              );
            } else if (state is RegisterState) {
              return const RegisterPage(
                title: '',
              );
            } else if (state is LogoutState) {
              return const LogOutPage(
                title: 'ghfg',
              );
            } else if (state is SignInState) {
              return const SignInPage(
                title: 'ghfg',
              );
            } else if (state is RegisterSuccesfullState) {
              return const RegisterSuccesfullPage(
                title: 'ghfg',
              );
            }

            return const WelcomePage(
              title: 'Welcome',
            );
          },
        ),
      ),
    );
  }
}
