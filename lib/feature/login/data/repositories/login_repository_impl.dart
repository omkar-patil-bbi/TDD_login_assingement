import 'package:task3/feature/login/domain/entities/user_details.dart';

import '../../domain/repositories/login_repository.dart';
import '../datasource/login_localdata_source.dart';
import '../model/login_model.dart';

class LoginRepositoryImpl implements LoginRepositories {
  late final LoginLocalDataSource localDataSource;

  LoginRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<String>? getScreenNumber() {
    return localDataSource.getScreenNumber();
  }

  @override
  Future<UserDetails>? getUserDetail() {
    return localDataSource.getUserDetail();
  }

  @override
  Future<bool>? login(String email, String pass) {
    return localDataSource.login(email, pass);
  }

  @override
  Future? setScreenNumber(String screenNumber) {
    return localDataSource.setScreenNumber(screenNumber);
  }

  @override
  Future? setUserDetails(UserDetails userDetails) {
    return localDataSource.setUserDetails(LoginModel(
        name: userDetails.name,
        age: userDetails.age,
        email: userDetails.email,
        pass: userDetails.pass));
  }
}
