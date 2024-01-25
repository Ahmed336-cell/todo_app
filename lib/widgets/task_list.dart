import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/shared_task.dart';
import 'package:todo_app/screens/add_task.dart';
import 'package:todo_app/screens/update_task.dart';
import 'package:todo_app/widgets/task_tile.dart';

import '../model/task.dart';


class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SharedTask>(
      builder: (context, taskData, child) {
        return ListView.builder(itemBuilder: (context, index) {
          return TaskTile(taskTitle: taskData.tasks[index].name, isChecked: taskData.tasks[index].isDone,
            timeLeft: taskData.tasks[index].date!.difference(DateTime.now()).inMinutes>0?('${taskData.tasks[index].date!.difference(DateTime.now()).inHours.toString()} Hours left'):'Time Expired',
            checkboxCallback: (checkBoxState) {
              taskData.updateTask(taskData.tasks[index]);
            },
            longPressCallback: (){

              taskData.deleteTask(taskData.tasks[index]);

            },
            taskDetails: taskData.tasks[index].details,
            updateCallback: (){
              _updateTask(context, taskData.tasks[index]);
            },
           );
        },
          itemCount: taskData.taskCount,
        );

      },

    );
  }

  void _updateTask(BuildContext context, Task task) {
    // Navigate to the AddTaskScreen for updating the task
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) => UpdateTaskScreen(task: task,));

  }
}