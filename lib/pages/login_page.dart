import 'package:authentication_system/componetns/my_button.dart';
import 'package:authentication_system/componetns/my_textfield.dart';
import 'package:authentication_system/componetns/squre_tile.dart';
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                  height: 40,
                ),
                MyTextField(
                  controller: usernameController,
                  hintText: "User Name",
                  obscureText: false,
                ),

                // password text field
                const SizedBox(
                  height: 20,
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
                  height: 30,
                ),
                // sign in button
                MyButton(
                  onTap: signUserIn,
                ),
                const SizedBox(
                  height: 50,
                ),
                // continue with apple or google
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 97, 97, 97),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "or continue with",
                          style: TextStyle(
                            color: Color.fromARGB(255, 97, 97, 97),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 97, 97, 97),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // apple and google sign in
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SqureTile(imagePath: "lib/images/google.png"),
                    SizedBox(width: 10),
                    SqureTile(imagePath: "lib/images/apple.png"),
                    SizedBox(width: 10),
                    SqureTile(imagePath: "lib/images/ms.png"),
                  ],
                ),

                // not a member sign up
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "not a member?",
                      style: TextStyle(color: Color.fromARGB(255, 97, 97, 97)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Register now!",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
