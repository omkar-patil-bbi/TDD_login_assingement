import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
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
      emit(WelcomeState());
    });

    on<RegisterEvent>((event, emit) {
      emit(RegisterState());
    });

    on<LogoutEvent>((event, emit) {
      emit(LogoutState());
    });

    on<SignInEvent>((event, emit) {
      emit(SignInState());
    });

    on<RegisterSuccesfullevent>((event, emit) {
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

    //add(event)
  }
}
