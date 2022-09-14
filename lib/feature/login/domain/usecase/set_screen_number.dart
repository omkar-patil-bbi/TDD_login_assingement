import 'package:task3/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import 'dart:ffi';

import '../repositories/login_repository.dart';

class SetScreenNumber {
  final LoginRepositories repository;
  SetScreenNumber(this.repository);
  Future<Either<Failure, Void>> call({required String screenNumber}) async {
    return await repository.setScreenNumber(screenNumber);
  }
}
