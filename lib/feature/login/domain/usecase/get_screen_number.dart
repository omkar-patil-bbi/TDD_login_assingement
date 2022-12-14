import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/login_repository.dart';

class GetScreenNumber {
  final LoginRepositories repository;
  GetScreenNumber(this.repository);
  Future<Either<Failure, String>> call() async {
    return await repository.getScreenNumber();
  }
}
