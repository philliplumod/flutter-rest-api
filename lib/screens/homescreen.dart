import 'package:flutter/material.dart';
import 'package:rest_api_flutter/model/user.dart';

import '../services/user_api.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

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
              title: Text(user.name.first),
              subtitle: Text(user.dob.date.toString()),
              tileColor: color,
            );
          }),
    );
  }

  Future<void> fetchUsers() async {
    final reponse = await UserApi.fetchUser();
    setState(() {
      users = reponse;
    });
  }
}
