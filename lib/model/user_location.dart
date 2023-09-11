class UserLocation {
  final String city;
  final String country;
  final String postcode;
  final String state;
  // final String street;
  final UserLocationStreet street;
  final UserLocationTimezone timezone;

  UserLocation(
      {required this.city,
      required this.country,
      required this.postcode,
      required this.state,
      required this.street,
      required this.timezone});

  factory UserLocation.fromMap(Map<String, dynamic> e) {
    final street = UserLocationStreet(
      number: e["street"]['number'].toString(),
      name: e['street']['name'],
    );
    final timezone = UserLocationTimezone(
        description: e['timezone']['description'],
        offset: e['timezone']['offset']);
    return UserLocation(
        city: e['city'],
        country: e['country'],
        postcode: e['postcode'].toString(),
        state: e['state'],
        street: street,
        timezone: timezone);
  }
}

class UserLocationStreet {
  final String number;
  final String name;

  UserLocationStreet({required this.number, required this.name});
}

class UserLocationTimezone {
  final String description;
  final String offset;

  UserLocationTimezone({required this.description, required this.offset});
}
