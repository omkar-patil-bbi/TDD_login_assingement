import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
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
}
