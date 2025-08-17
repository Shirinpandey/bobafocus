import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  Function(bool?)? onChanged;

  TodoItem({
    super.key,
    required this.taskname,
    required this.taskcompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Checkbox(
            value: taskcompleted,
            onChanged: onChanged,
            // checkColor: Colors.brown,
            fillColor: WidgetStateProperty.all(
              const Color.fromARGB(
                255,
                96,
                45,
                26,
              ), // background color of the checkbox
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 179, 154, 145),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(taskname),
          ),
        ],
      ),
    );
  }
}
