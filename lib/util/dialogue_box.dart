import 'package:flutter/material.dart';

class DialogueBox extends StatelessWidget {
  const DialogueBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.brown,
      content: Container(height: 120),
    );
  }
}
