import 'package:task3/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import 'dart:ffi';

import '../entities/user_details.dart';
import '../repositories/login_repository.dart';

class SetUserDetail {
  final LoginRepositories repository;
  SetUserDetail(this.repository);
  Future<Either<Failure, Void>> call({required UserDetails userDetails}) async {
    return await repository.setUserDetails(userDetails);
  }
}
