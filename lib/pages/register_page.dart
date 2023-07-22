import 'package:authentication_system/componetns/my_button.dart';
import 'package:authentication_system/componetns/my_textfield.dart';
import 'package:authentication_system/componetns/squre_tile.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text,
        );
      } else {
        showErrorMessege("The passwords do not match");
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      showErrorMessege(e.code);
    }
  }

  void showErrorMessege(String error) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(error),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: Center(
            child: SingleChildScrollView(
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
                    "Let's create an account for you!",
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
                    hintText: "Email",
                    obscureText: false,
                  ),

                  // password text field
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  // confirm password
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    obscureText: true,
                  ),
                  // forgot password
                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  // sign in button
                  MyButton(
                    text: "Sign Up",
                    onTap: signUserUp,
                  ),
                  const SizedBox(
                    height: 30,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SqureTile(
                        imagePath: "lib/images/google.png",
                        onTap: () => AuthService().signInWithGoogle(),
                      ),
                      const SizedBox(width: 10),
                      const SqureTile(
                        imagePath: "lib/images/apple.png",
                        onTap: null,
                      ),
                      const SizedBox(width: 10),
                      const SqureTile(
                        imagePath: "lib/images/ms.png",
                        onTap: null,
                      ),
                    ],
                  ),
                  // not a member sign up
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "already a member ?",
                        style:
                            TextStyle(color: Color.fromARGB(255, 97, 97, 97)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Login now!",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
