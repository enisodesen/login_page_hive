import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final String password;

  User(this.name, this.username, this.password);
}
