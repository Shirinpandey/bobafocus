import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  final Function(bool?)? onChanged; // <- final

  const TodoItem({
    super.key,
    required this.taskname,
    required this.taskcompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24, top: 24),
      child: Row(
        children: [
          Checkbox(
            value: taskcompleted,
            onChanged: onChanged,
            activeColor: Colors.brown,
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 179, 154, 145),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                taskname,
                style: TextStyle(
                  decoration: taskcompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationThickness: 2,
                  color: const Color(0xFF6D4C41),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
