import '../entities/user_details.dart';
import '../repositories/login_repository.dart';

class SetUserDetail {
  final LoginRepositories repository;
  SetUserDetail(this.repository);
  Future<void> call({required UserDetails userDetails}) async {
    return await repository.setUserDetails(userDetails);
  }
}
