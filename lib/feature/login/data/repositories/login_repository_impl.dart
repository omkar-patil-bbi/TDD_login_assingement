import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:task3/core/error/exception.dart';
import 'package:task3/feature/login/domain/entities/user_details.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasource/login_localdata_source.dart';
import '../model/login_model.dart';

class LoginRepositoryImpl implements LoginRepositories {
  late final LoginLocalDataSource localDataSource;

  LoginRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, String>> getScreenNumber() async {
    try {
      return Future.value(Right(await localDataSource.getScreenNumber()));
    } on CacheException {
      return Future.value(Left(CacheFailure as Failure));
    }
  }

  @override
  Future<Either<Failure, UserDetails>> getUserDetail() async {
    try {
      return Future.value(Right(await localDataSource.getUserDetail()));
    } on CacheException {
      return Future.value(Left(CacheFailure as Failure));
    }
  }

  @override
  Future<Either<Failure, bool>> login(String email, String pass) async {
    try {
      return Future.value(Right(await localDataSource.login(email, pass)));
    } on CacheException {
      return Future.value(Left(CacheFailure as Failure));
    }
  }

  @override
  Future<Either<Failure, bool>> setScreenNumber(String screenNumber) async {
    try {
      return Future.value(
          Right(await localDataSource.setScreenNumber(screenNumber)));
    } on CacheException {
      return Future.value(Left(CacheFailure as Failure));
    }
  }

  @override
  Future<Either<Failure, bool>> setUserDetails(UserDetails userDetails) async {
    try {
      return Future.value(Right(await localDataSource.setUserDetails(LoginModel(
          name: userDetails.name,
          age: userDetails.age,
          email: userDetails.email,
          pass: userDetails.pass))));
    } on CacheException {
      return Future.value(Left(CacheFailure as Failure));
    }
  }

  @override
  Future<Either<Failure, bool>> isRemember() async {
    try {
      return Future.value(Right(await localDataSource.isRemember()));
    } on CacheException {
      return Future.value(Left(CacheFailure as Failure));
    }
  }

  @override
  Future<Either<Failure, bool>> setisRemember(bool value) async {
    try {
      return Future.value(Right(await localDataSource.setisRemember(value)));
    } on CacheException {
      return Future.value(Left(CacheFailure as Failure));
    }
  }
}
