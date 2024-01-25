import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/shared_task.dart';
import 'package:todo_app/widgets/task_list.dart';

import 'add_task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}


class _TasksScreenState extends State<TasksScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) => AddTaskScreen());
        },
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(

          padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                child: Icon(
                  Icons.list,
                  color: Colors.white,
                  size: 50,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white30,

                ),
              ),

              SizedBox(
                height: 10,
              ),
              Text(
                'Todo',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${Provider.of<SharedTask>(context).taskCount} Tasks',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TaskList(),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),

        ),
      ]
      ),
    );
  }
}