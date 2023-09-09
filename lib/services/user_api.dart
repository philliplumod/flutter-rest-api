import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_flutter/model/user.dart';
import '../model/user_name.dart';

class UserApi {
  static Future<List<User>> fetchUser() async {
    debugPrint('Fetching users...');
    // 1. Define the API URL as a string constant
    const url = 'https://randomuser.me/api/?results=10';
    // 2. Convert the string into a Uri object
    final uri = Uri.parse(url);
    // 3. Make a GET request to the URL
    final response = await http.get(uri);
    // 4. Get the response body and decode it
    final body = response.body;
    final json = jsonDecode(body);
    // 5. Get the results array from the decoded JSON
    final results = json['results'] as List<dynamic>;
    // 6. Map each user JSON object to a User object
    final users = results.map((user) {
      // 6.1. Map the name JSON object to a UserName object
      return User(
          UserName(
              title: user['name']['title'],
              first: user['name']['first'],
              last: user['name']['last'],

// class UserApi {
//   static Future<List<User>> fetchUser() async {
//     debugPrint('Fetching users...');
//     const url = 'https://randomuser.me/api/?results=10';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     final body = response.body;
//     final json = jsonDecode(body);
//     final results = json['results'] as List<dynamic>;
//     final users = results.map((user) {
//       return User(
//           UserName(
//               title: user['name']['title'],
//               first: user['name']['first'],
//               last: user['name']['last']),
//           gender: user['gender'],
//           email: user['email'],
//           phone: user['phone'],
//           cell: user['cell']);
//     }).toList();
//     debugPrint(users.toString());
//     return users;
//   }
// }