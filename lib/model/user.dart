import 'user_name.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final UserName name;
  User(this.name,
      {required this.gender,
      required this.email,
      required this.phone,
      required this.cell});

  String get fullName => '${name.title} ${name.first} ${name.last}';
}
