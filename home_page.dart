import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:start_app/data/database.dart';
import 'package:start_app/utility/Dialog_Box.dart';

import '../utility/todo_tile.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class  _HomePageState extends State<HomePage> {
  //reference the hive box
  final _mybox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();
  @override
  void initState() {
    // if this is the first time opening the app,then create default data
    if(_mybox.get("TODOLIST") == null){
        db.createInitialData();
    }else{
      //there already exists data
      db.loadData();
    }

    super.initState();
  }
  //text controller
  final _controller = TextEditingController();


//CheckBox was tapped
  void checkBoxChanged(bool? value , int index ){
  setState(() {
    db.toDoList[index][1] = !db.toDoList[index][1];
  });
  db.UpdateDataBase();
  }

  //method to save new task
  void Save_the_task(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.UpdateDataBase();
  }
  //delete task
  void delete_task(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.UpdateDataBase();
  }
// create  new task
  void create_New_task(){
     showDialog(
         context: context,
         builder: (context){
             return DialogBox(
               controller: _controller,
               onSave: Save_the_task,
               onCancel: () => Navigator.of(context).pop(),
             );
              },
         );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('TO DO LIST'),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: create_New_task,
          child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            TaskName: db.toDoList[index][0],
            Task_Completed: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value , index),
            Delete_funtion: (context) => delete_task(index),
          );
        },
      ),
    );
  }
}
