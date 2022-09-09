import 'package:equatable/equatable.dart';

class UserDetails extends Equatable {
  String name;
  num age;
  String email;
  String pass;

  UserDetails(
      {required this.name,
      required this.age,
      required this.email,
      required this.pass});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
