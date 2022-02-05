import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/model/task.dart';
import 'package:todo_list_app/providers/task_provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DataInputPage extends StatelessWidget {
  DataInputPage({ Key? key }) : super(key: key);

  static const String id = '/data-input';
  final TextEditingController _titleController = TextEditingController();

  addTask(BuildContext context){
    Task newTask = Task(title: _titleController.text, isCompleted: false);
    Provider.of<TaskProvider>(context,listen: false).addTask(newTask);
    //to go back to screen
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Add To-Do'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          'Adding a new task?'.text.size(20).black.semiBold.makeCentered(),
          24.heightBox,
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder()),
            ),
            24.heightBox,
            CupertinoButton(
              child: 'Add Task'.text.make(),
              onPressed: () {
                if(_titleController.text.isEmpty){
                  Fluttertoast.showToast(
                    msg: "Text Field cannot be empty",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                  );
                }else{
                  addTask(context);
                }
                
              },
              color: Theme.of(context).primaryColor,

              )
        ],
        ).p(24),
    );
  }
}