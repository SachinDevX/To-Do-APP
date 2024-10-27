import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget{
  final String TaskName;
  final bool Task_Completed;
  Function(bool?)? onChanged;
  Function(BuildContext)? Delete_funtion;
   ToDoTile({
    super.key,
    required this.TaskName,
    required this.Task_Completed,
    required this.onChanged,
     required this.Delete_funtion,
  });

  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
    child: Slidable(
      endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: Delete_funtion,
            icon: Icons.delete_forever,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(12),)]),
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            
            //chekbox
            Checkbox(
                value: Task_Completed,
                onChanged: onChanged,
                activeColor: Colors.black,
            ),
            
            //task name
            Text(
                TaskName,
              style: TextStyle(decoration: Task_Completed ? TextDecoration.lineThrough: TextDecoration.none,),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.yellow,
        borderRadius: BorderRadius.circular(12)),
        
      ),
    ),
  );
  }
}
