import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String TaskName;
  final bool TaskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFUnction;

  ToDoTile({super.key,
required this.TaskName,
required this.TaskCompleted,
required this.onChanged,
required this.deleteFUnction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), 
        children:[SlidableAction(
          onPressed: deleteFUnction,
          icon: Icons.delete,
          backgroundColor: Colors.red.shade300,
          borderRadius: BorderRadius.circular(12),
        ),]),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(value: TaskCompleted, onChanged: onChanged,
              activeColor: Colors.black,),
              
      
              Text(TaskName,
              style: TextStyle(
                decoration: TaskCompleted 
                ?TextDecoration.lineThrough
                :TextDecoration.none,
              ),),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}