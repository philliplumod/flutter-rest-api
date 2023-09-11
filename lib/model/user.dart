import 'package:rest_api_flutter/model/user_dob.dart';
import 'package:rest_api_flutter/model/user_location.dart';

import 'user_name.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  User(
    this.name,
    this.dob,
    this.location, {
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
  });
  factory User.fromMap(Map<String, dynamic> e) {
    final location = UserLocation.fromMap(e['location']);
    final username = UserName.fromMap(e['name']);
    final dob = UserDob.fromMap(e['dob']);

    return User(
      username,
      dob,
      location,
      gender: e['gender'],
      email: e['email'],
      phone: e['phone'],
      cell: e['cell'],
    );
  }
}
