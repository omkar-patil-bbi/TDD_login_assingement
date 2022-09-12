import '../entities/user_details.dart';

abstract class LoginRepositories {
  Future<String> getScreenNumber();
  Future setScreenNumber(String screenNumber);

  Future<UserDetails> getUserDetail();
  Future setUserDetails(UserDetails userDetails);

  Future<bool> login(String email, String pass);
}
