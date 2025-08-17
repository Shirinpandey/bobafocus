import 'package:bobafocusflutter/navigationbar.dart';
import 'package:bobafocusflutter/util/dialogue_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'util/todo_item.dart';

class Todo {
  String taskName;
  bool isCompleted;

  Todo({required this.taskName, this.isCompleted = false});
}

// ChecklistPage StatefulWidget
class ChecklistPage extends StatefulWidget {
  const ChecklistPage({super.key, required this.title});
  final String title;

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

// State class
class _ChecklistPageState extends State<ChecklistPage> {
  List<Todo> todoList = [
    Todo(taskName: 'Make tutorial'),
    Todo(taskName: 'Finish work'),
    Todo(taskName: 'HEL'),
  ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      todoList[index].isCompleted = value ?? false;
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogueBox();
      },
    );
  }

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
            color: const Color(0xFF6D4C41),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoItem(
            taskname: todoList[index].taskName,
            taskcompleted: todoList[index].isCompleted,
            onChanged: (value) => checkboxChanged(value, index),
          );
        },
      ),
    );
  }
}
