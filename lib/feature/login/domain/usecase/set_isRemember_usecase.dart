import 'dart:ffi';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/login_repository.dart';

class SetIsRemember {
  final LoginRepositories repository;
  SetIsRemember(this.repository);
  Future<Either<Failure, Void>> call({required String value}) async {
    return await repository.setScreenNumber(value);
  }
}
