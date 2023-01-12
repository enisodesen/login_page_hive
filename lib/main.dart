import 'package:flutter/material.dart';

import '/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/user.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('users');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
