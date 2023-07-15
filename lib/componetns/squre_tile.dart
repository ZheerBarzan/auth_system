import 'package:flutter/material.dart';

class SqureTile extends StatelessWidget {
  final String imagePath;
  const SqureTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade200),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}
