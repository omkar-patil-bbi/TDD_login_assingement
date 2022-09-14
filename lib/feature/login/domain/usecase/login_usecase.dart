import 'package:task3/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../repositories/login_repository.dart';

class LoginUsecase {
  final LoginRepositories repository;
  LoginUsecase(this.repository);
  Future<Either<Failure, bool>> call(
      {required String email, required String pass}) async {
    return await repository.login(email, pass);
  }
}
