import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task3/core/error/failure.dart';
import 'package:task3/feature/login/domain/usecase/get_screen_number.dart';
import 'package:task3/feature/login/domain/usecase/get_user_detail.dart';
import 'package:task3/feature/login/domain/usecase/set_isRemember_usecase.dart';
import 'package:task3/feature/login/domain/usecase/set_screen_number.dart';
import 'package:task3/feature/login/domain/usecase/set_user_detail.dart';

import '../../domain/entities/user_details.dart';
import '../../domain/usecase/isRemember_uscase.dart';
import '../../domain/usecase/login_usecase.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  GetScreenNumber getScreenNumber;
  GetUserDetail getUserDetail;
  LoginUsecase login;
  SetScreenNumber setScreenNumber;
  SetUserDetail setUserDetail;
  Isremember isremember;
  SetIsRemember setIsRemember;

  AppBloc(
      {required this.getScreenNumber,
      required this.getUserDetail,
      required this.isremember,
      required this.login,
      required this.setIsRemember,
      required this.setScreenNumber,
      required this.setUserDetail})
      : super(AppInitial()) {
    on<AppEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<WelcomeEvent>((event, emit) {
      saveScreenNumber("screen 1");
      emit(WelcomeState());
    });

    on<RegisterEvent>((event, emit) {
      saveScreenNumber("screen 2");
      emit(RegisterState());
    });

    on<LogoutEvent>((event, emit) {
      saveScreenNumber("screen 5");
      emit(LogoutState());
    });

    on<SignInEvent>((event, emit) {
      saveScreenNumber("screen 4");
      emit(SignInState());
    });

    on<RegisterSuccesfullevent>((event, emit) {
      saveScreenNumber("screen 3");
      emit(RegisterSuccesfullState());
    });
  }

  loadWelcomeLogin() {
    add(WelcomeEvent());
  }

  loadRegisterPage() {
    add(RegisterEvent());
  }

  loadLogoutPage() {
    add(LogoutEvent());
  }

  loadSingInPage() {
    add(SignInEvent());
  }

  loadRegisterSuccesfullPage() {
    add(RegisterSuccesfullevent());
  }

  void saveScreenNumber(String screenNumber) {
    setScreenNumber(screenNumber: screenNumber);
  }

  void saveUserDetails(UserDetails userDetails) {
    setUserDetail(userDetails: userDetails);
  }

  void saveIsRemember(bool value) {
    setIsRemember(value: value);
  }

  Future<void> getSavedScreenNumber() async {
    Either<Failure, String> either;

    either = await getScreenNumber();

    bool box = await getSavedIsRemember();

    either.fold((error) => add(WelcomeEvent()), (screenNumber) {
      if (screenNumber == "screen 1") {
        add(WelcomeEvent());
      } else if (screenNumber == "screen 2") {
        add(RegisterEvent());
      } else if (screenNumber == "screen 3" ||
          screenNumber == "screen 5" && box == false) {
        add(RegisterSuccesfullevent());
      } else if (screenNumber == "screen 4") {
        add(SignInEvent());
      } else if (box == true) {
        add(LogoutEvent());
      }
    });
  }

  Future<void> getSavedUserDetails() async {
    Either<Failure, UserDetails> either;

    either = await getUserDetail();

    either.fold((l) => null, (r) => null);
  }

  Future<bool> getSavedIsRemember() async {
    Either<Failure, bool> either;

    either = await isremember();
    bool check = false;

    either.fold((error) => add(WelcomeEvent()), (value) {
      check = value;
    });
    return check;
  }

  Future<void> checkLogin(String email, String pass) async {
    Either<Failure, bool> either;

    either = await login(email: email, pass: pass);

    either.fold((error) => add(WelcomeEvent()), (logInOrNot) {
      if (logInOrNot == true) {
        add(LogoutEvent());
      } else {
        add(RegisterSuccesfullevent());
      }
    });
  }
}
