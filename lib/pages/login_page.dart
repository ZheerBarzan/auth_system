import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: const Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                //logo
                Icon(
                  Icons.lock,
                  size: 100,
                ),
                SizedBox(
                  height: 50,
                ),

                Text(
                  "W E L L C O M E ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 53, 51, 51),
                      fontSize: 20,
                      fontFamily: 'Segoe UI'),
                ),

                // wellcome back messege

                // username text field

                // password text field

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
