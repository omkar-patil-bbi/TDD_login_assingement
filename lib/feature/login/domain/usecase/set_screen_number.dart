import '../repositories/login_repository.dart';

class SetScreenNumber {
  final LoginRepositories repository;
  SetScreenNumber(this.repository);
  Future<void> call({required String screenNumber}) async {
    return await repository.setScreenNumber(screenNumber);
  }
}
