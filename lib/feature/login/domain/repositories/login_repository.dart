import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:task3/core/error/failure.dart';

import '../entities/user_details.dart';

abstract class LoginRepositories {
  Future<Either<Failure, String>> getScreenNumber();
  Future<Either<Failure, Void>> setScreenNumber(String screenNumber);

  Future<Either<Failure, UserDetails>> getUserDetail();
  Future<Either<Failure, Void>> setUserDetails(UserDetails userDetails);

  Future<Either<Failure, bool>> isRemember();
  Future<Either<Failure, Void>> setisRemember(bool value);

  Future<Either<Failure, bool>> login(String email, String pass);
}
