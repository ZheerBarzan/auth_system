import 'package:authentication_system/componetns/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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

                // sign in button

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
