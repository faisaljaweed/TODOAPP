import 'package:flutter/material.dart';
import 'package:todo/util/dailog_box.dart';
import 'package:todo/util/todo_tile.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList=[
  ["Faisal", false],
  ["Faisal", false]
  ];
final  _conttroller=TextEditingController();
  void checkBoxChanged(bool? value,int index){
    setState(() {
      
      toDoList[index][1]= !toDoList[index][1];
    });
  }


  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DailougeBox(controller:_conttroller ,
      onSave: saveNewTask,
      Cancel:()=> Navigator.of(context).pop(),);
    }
    );
  }


  void deleteTask(int index){
setState(() {
  toDoList.removeAt(index);
});
  }




  void saveNewTask()
  {
    setState(() {
      toDoList.add([_conttroller.text,false]);
      _conttroller.clear();
    });
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade400,
      appBar: AppBar(
       title: Text("TO DO"),
       elevation: 0,
       centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:createNewTask, 
      child: Icon(Icons.add),),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
          TaskName:toDoList[index][0] ,
           TaskCompleted:toDoList[index][1], 
           onChanged: (value)=>checkBoxChanged(value,index),
           deleteFUnction: (context)=>deleteTask(index),
           );
        },

      ),
    );
  }
}