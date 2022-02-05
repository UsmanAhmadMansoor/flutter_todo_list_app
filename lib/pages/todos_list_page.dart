import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/pages/data_input_page.dart';
import 'package:todo_list_app/providers/task_provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:lottie/lottie.dart';


class TodosPage extends StatelessWidget {
  const TodosPage({ Key? key }) : super(key: key);
  static const String id = '/todos-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Consumer<TaskProvider>(
      
        builder: (context,taskProvider,child)=> Column(
          children: [
            Expanded(
                child: (taskProvider.tasks.isEmpty)
                ? Center(
                    child: LottieBuilder.asset('assets/anim/sad.json'),
                )
                : ListView.builder(
                  itemCount: taskProvider.tasks.length,
                  itemBuilder: (context,index)=> Dismissible(
                    key: Key(taskProvider.tasks[index].title),
                    onDismissed: (v){
                      Provider.of<TaskProvider>(context,listen: false).removeTask(index);
                    },
                    child: Card(
                      child: ListTile(
                      title: Text(taskProvider.tasks[index].title),
                      subtitle: taskProvider.tasks[index].isCompleted
                       ? 'Completed'.text.make()
                       :'Incomplete'.text.make(),
                    ),
                    ),
                  ),
                ), 
              ),
              CupertinoButton(
                child: 'Add a New Task'.text.make(),
                onPressed: () {
                  // Navigator.pushNamed(context, DataInputPage.id);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DataInputPage()));
                },
                color: Colors.teal,
      
                )
          ],
          ).p(24),
      ),
    );
  }
}