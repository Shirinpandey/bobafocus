import 'package:bobafocusflutter/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'util/todo_item.dart';

class ChecklistPage extends StatefulWidget {
  const ChecklistPage({super.key, required this.title});
  final String title;

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8EDEB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8EDEB),
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF6D4C41), // deep coffee brown
          ),
        ),
      ),
      body: ListView(
        children: [
          TodoItem(
            taskname: 'FINISH WORK',
            taskcompleted: true,
            onChanged: (p0) {},
          ),
          TodoItem(
            taskname: 'wake up',
            taskcompleted: true,
            onChanged: (p0) {},
          ),
        ],
      ),
    );
  }
}
