import 'package:get_it/get_it.dart';
import 'package:task3/feature/login/domain/usecase/get_screen_number.dart';
import 'package:task3/feature/login/domain/usecase/get_user_detail.dart';
import 'package:task3/feature/login/domain/usecase/isRemember_uscase.dart';
import 'package:task3/feature/login/presentation/bloc/app_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerFactory(() => AppBloc(
      getScreenNumber: sl(),
      getUserDetail: sl(),
      isremember: sl(),
      login: sl(),
      setIsRemember: sl(),
      setScreenNumber: sl(),
      setUserDetail: sl()));

  sl.resetLazySingleton(instance: () => GetScreenNumber(sl()));
  sl.resetLazySingleton(instance: () => GetUserDetail(sl()));
  sl.resetLazySingleton(instance: () => Isremember(sl()));
  sl.resetLazySingleton(instance: () => GetUserDetail(sl()));
}
