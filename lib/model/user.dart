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
}

class UserName {
  final String title;
  final String first;
  final String last;

  UserName({required this.title, required this.first, required this.last});
}
