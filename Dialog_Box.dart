import 'package:flutter/material.dart';
import 'package:start_app/utility/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //get the user input
          TextField(
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder(),
                hintText : "Add New Task"),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              MyButton(text: 'Save', onPressed: onSave ),
              const SizedBox(width: 8,),

              MyButton(text: 'Cancel', onPressed: onCancel ),
            ],
          )
        ],),
      ),
    );
  }
}
