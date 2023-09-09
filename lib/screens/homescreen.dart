import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_flutter/model/user.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Flutter'),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final color =
                user.gender == 'male' ? Colors.blueAccent : Colors.pinkAccent;
            return ListTile(
              leading: Text(index.toString()),
              title: Text(
                  "${user.name.title} ${user.name.first} ${user.name.last}"),
              subtitle: Text(user.phone),
              tileColor: color,
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: fetchUsers),
    );
  }

  void fetchUsers() async {
    debugPrint('Fetching users...');
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    setState(() {
      users = results.map((user) {
        return User(
            UserName(
                title: user['name']['title'],
                first: user['name']['first'],
                last: user['name']['last']),
            gender: user['gender'],
            email: user['email'],
            phone: user['phone'],
            cell: user['cell']);
      }).toList();
    });
    debugPrint(results.toString());
  }
}
