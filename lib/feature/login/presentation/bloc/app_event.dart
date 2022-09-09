part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class WelcomeEvent extends AppEvent {}

class RegisterEvent extends AppEvent {}

class LogoutEvent extends AppEvent {}

class SignInEvent extends AppEvent {}

class RegisterSuccesfullevent extends AppEvent {}
