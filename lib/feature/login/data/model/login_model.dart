import 'package:equatable/equatable.dart';

import '../../domain/entities/user_details.dart';

class LoginModel extends UserDetails {
  LoginModel(
      {required String name,
      required num age,
      required String email,
      required String pass})
      : super(name: name, age: age, email: email, pass: pass);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        name: json['name'],
        age: int.parse(json['age']),
        email: json['email'],
        pass: json['pass']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age, 'email': email, 'pass': pass};
  }
}
