import 'package:task3/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:task3/feature/login/domain/repositories/login_repository.dart';

import '../entities/user_details.dart';

class GetUserDetail {
  final LoginRepositories repository;
  GetUserDetail(this.repository);

  Future<Either<Failure, UserDetails>> call() async {
    return await repository.getUserDetail();
  }
}
