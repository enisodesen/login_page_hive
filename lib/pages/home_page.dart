import 'package:flutter/material.dart';
import 'package:login_hive/models/user.dart';
import 'package:login_hive/pages/user_list.dart';
import 'register_page.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/login_signup_button.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                controller: usernameController,
                icon: Icons.person,
                text: 'Enter your username',
                keyboardType: TextInputType.text),
            CustomTextField(
                controller: passwordController,
                icon: Icons.lock,
                text: 'Enter your password',
                keyboardType: TextInputType.text,
                obscureText: true),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: LoginAndSignupButton(
                  alertContext: 'Your are now logged into the our system!y',
                  alertText: 'Successful Login 👍',
                  buttonBackgroundColor: Colors.blue.shade300,
                  onClick: () {
                    late User user;
                    try {
                      user = Hive.box<User>('users')
                          .values
                          .where((element) =>
                              element.username == usernameController.text)
                          .first;
                      if (user.password == usernameController.text) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const UserList();
                          },
                        ));
                      } else {
                        showDialog(
                          context: context,
                          builder: (bcontext) {
                            return const AlertDialog(
                              title: Text('Invalid username or password'),
                            );
                          },
                        );
                      }
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (bcontext) {
                          return const AlertDialog(
                            title: Text('Invalid username or password'),
                          );
                        },
                      );
                    }
                  },
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
                },
                child: const Text('Or Sign Up')),
          ],
        ),
      ),
    );
  }
}
