import 'package:flutter/material.dart';
import 'package:todo/util/button.dart';
class DailougeBox extends StatelessWidget {

  final controller;
  VoidCallback onSave;
  VoidCallback Cancel;
  DailougeBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.Cancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,

              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new Task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed:onSave),
                const SizedBox(width: 8,),
                MyButton(text: "Cancel", onPressed: Cancel)
              ],
            ),
          ],
        ),
      ),
    );
  }
}