import 'package:flutter/material.dart';
import 'package:todo/dialog.dart';
import 'package:todo/todo_tilte.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();

  List todoList = [
    ["Make project" , false],
    ["Do Assignment", false],
  ];

  void checkBoxChanged(bool? vlaue, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void saveNewTask(){
    setState(() {
      todoList.add([_controller.text,false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  void createNewTask(){
    showDialog(
      context: context,
      builder: (context){
        return DialogBoxPage(
          controller: _controller,
          onSave: saveNewTask,
          onCancle: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index){
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdbb6ee),
      appBar: AppBar(
        title: Text("TO DO"),
        backgroundColor: Color(0xFFb57edc),
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
          itemBuilder: (context, index){
            return ToDoTitlePage(
                taskName: todoList[index] [0],
                taskCompleted: todoList[index][1],
                onChanged: (value) => checkBoxChanged(value,index),
                deleteFunction: (context) => deleteTask(index),
            );
          }
      )
    );
  }
}
