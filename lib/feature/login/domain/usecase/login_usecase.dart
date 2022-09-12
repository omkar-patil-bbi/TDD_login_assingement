import '../repositories/login_repository.dart';

class LoginUsecase {
  final LoginRepositories repository;
  LoginUsecase(this.repository);
  Future<bool> call({required String email, required String pass}) async {
    return await repository.login(email, pass);
  }
}
