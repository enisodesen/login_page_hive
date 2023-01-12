import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_hive/models/user.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/login_signup_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: const [
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Create an Account/ İt\'s free',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                CustomTextField(
                    controller: nameController,
                    text: 'Enter your name',
                    icon: Icons.person,
                    keyboardType: TextInputType.text),
                CustomTextField(
                    controller: usernameController,
                    text: 'Enter your email',
                    icon: Icons.mail,
                    keyboardType: TextInputType.emailAddress),
                CustomTextField(
                    controller: passwordController,
                    text: 'Password',
                    icon: Icons.lock,
                    keyboardType: TextInputType.text),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: LoginAndSignupButton(
                        buttonBackgroundColor: Colors.red.shade300,
                        alertText: 'Congrutalutions 👏',
                        alertContext:
                            'Your Account has been created succefsully',
                        onClick: () {
                          Hive.box<User>('users').add(User(
                              nameController.text,
                              usernameController.text,
                              usernameController.text));
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
