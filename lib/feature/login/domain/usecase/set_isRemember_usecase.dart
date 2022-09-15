import 'dart:ffi';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/login_repository.dart';

class SetIsRemember {
  final LoginRepositories repository;
  SetIsRemember(this.repository);
  Future<Either<Failure, bool>> call({required bool value}) async {
    return await repository.setisRemember(value);
  }
}
