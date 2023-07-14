import 'package:authentication_system/componetns/my_button.dart';
import 'package:authentication_system/componetns/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                //logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                // wellcome back messege
                const Text(
                  "W E L L C O M E ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 53, 51, 51),
                      fontSize: 20,
                      fontFamily: 'Segoe UI'),
                ),
                // username text field

                const SizedBox(
                  height: 50,
                ),
                MyTextField(
                  controller: usernameController,
                  hintText: "User Name",
                  obscureText: false,
                ),

                // password text field
                const SizedBox(
                  height: 50,
                ),
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                // forgot password
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                // sign in button
                MyButton(
                  onTap: signUserIn,
                ),

                // continue with apple or google

                // not a member sign up
              ],
            ),
          ),
        ),
      ),
    );
  }
}
