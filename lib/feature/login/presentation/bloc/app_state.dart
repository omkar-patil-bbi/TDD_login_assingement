part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class WelcomeState extends AppState {}

class RegisterState extends AppState {}

class LogoutState extends AppState {}

class SignInState extends AppState {}

class RegisterSuccesfullState extends AppState {}
