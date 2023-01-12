import 'package:flutter/material.dart';
import 'package:login_hive/models/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late List<User> _users;
  @override
  void initState() {
    super.initState();
    _users = Hive.box<User>('users').values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final item = _users[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    color: Colors.green,
                    child: ListTile(
                      title: Text(
                        '${index + 1} . Username : ${item.username}',
                        style: const TextStyle(fontSize: 24),
                      ),
                      subtitle: Text(
                        '   Name : ${item.name}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
