import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{

  List toDoList = [];
  // reference the box

  final _mybox = Hive.box('myBox');

  //run this method if this is the 1st time opening this app
void createInitialData(){
  toDoList = [
   ["Make tutorial",false],
    ["Do exercise",false],
  ];
}
//load the data from daṭabase
void loadData(){
  toDoList = _mybox.get("TODOLIST");
}

//update the database
void UpdateDataBase(){
  _mybox.put("TODOLIST",toDoList);
}
}
