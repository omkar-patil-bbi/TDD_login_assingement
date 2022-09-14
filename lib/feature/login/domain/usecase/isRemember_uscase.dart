import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/login_repository.dart';

class Isremember {
  final LoginRepositories repository;
  Isremember(this.repository);
  Future<Either<Failure, bool>> call() async {
    return await repository.isRemember();
  }
}
