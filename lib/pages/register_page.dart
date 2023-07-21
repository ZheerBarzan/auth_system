import 'package:authentication_system/componetns/my_button.dart';
import 'package:authentication_system/componetns/my_textfield.dart';
import 'package:authentication_system/componetns/squre_tile.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      // we can also use one method for the code below using this code
      // showerorrmessege(e.code);
      // and make the chiled of the method text(messege)

      if (e.code == "user-not-found") {
        emailNotFoundMessege();
      } else if (e.code == "wrong-password") {
        passwordIncorrectMessege();
      }
    }
  }

  void emailNotFoundMessege() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("Wrong Email or UserName!!✌️😎"),
        );
      },
    );
  }

  void passwordIncorrectMessege() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("your password is wrong!!✌️😎"),
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
                  MyTextField(
                    controller: passwordController,
                    hintText: "Confirm Password",
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
                    onTap: signUserUp,
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
