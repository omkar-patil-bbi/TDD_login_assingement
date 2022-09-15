import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task3/feature/login/domain/usecase/get_screen_number.dart';
import 'package:task3/feature/login/domain/usecase/get_user_detail.dart';
import 'package:task3/feature/login/domain/usecase/isRemember_uscase.dart';
import 'package:task3/feature/login/presentation/bloc/app_bloc.dart';

import 'feature/login/data/datasource/login_localdata_source.dart';
import 'feature/login/data/repositories/login_repository_impl.dart';
import 'feature/login/domain/repositories/login_repository.dart';
import 'feature/login/domain/usecase/login_usecase.dart';
import 'feature/login/domain/usecase/set_isRemember_usecase.dart';
import 'feature/login/domain/usecase/set_screen_number.dart';
import 'feature/login/domain/usecase/set_user_detail.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory(() => AppBloc(
      getScreenNumber: getIt(),
      getUserDetail: getIt(),
      isremember: getIt(),
      login: getIt(),
      setIsRemember: getIt(),
      setScreenNumber: getIt(),
      setUserDetail: getIt()));

  getIt.registerLazySingleton(() => GetScreenNumber(getIt()));
  getIt.registerLazySingleton(() => GetUserDetail(getIt()));
  getIt.registerLazySingleton(() => Isremember(getIt()));
  getIt.registerLazySingleton(() => LoginUsecase(getIt()));
  getIt.registerLazySingleton(() => SetScreenNumber(getIt()));
  getIt.registerLazySingleton(() => SetUserDetail(getIt()));
  getIt.registerLazySingleton(() => SetIsRemember(getIt()));

  getIt.registerLazySingleton<LoginRepositories>(
      () => LoginRepositoryImpl(localDataSource: getIt()));

  // getIt.registerLazySingleton<LoginLocalDataSource>(
  //     () => LoginLocalDataSourceImpl(sharedPreferences: getIt()));

  getIt.registerLazySingleton<LoginLocalDataSource>(
      () => LoginLocalDataSourceImpl(sharedPreferences: getIt()));

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}
