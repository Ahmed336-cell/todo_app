import 'package:provider/provider.dart';
import 'package:todo_app/model/shared_task.dart';
import 'package:date_field/date_field.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/tasks_screen.dart';
import 'package:flutter/material.dart';



class AddTaskScreen extends StatefulWidget {
   AddTaskScreen({super.key ,this.task });
   final Task? task;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String? newTaskTitle="";
  String? newTaskDetails="";
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).viewInsets.bottom + 450,
      color: Colors.white30,
      child: Container(
          height: MediaQuery.of(context).viewInsets.bottom + 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.purple, fontSize: 25),
                ),
                TextField(
                  // controller: myController,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    newTaskTitle = value;
                  },
                ),
                SizedBox(height: 5,),

                Text(
                  'Add Details',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.purple, fontSize: 25),
                ),
                TextField(
                  // controller: myController,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    newTaskDetails = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Add Deadline',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.purple, fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: null),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                  ),
                  mode: DateTimeFieldPickerMode.dateAndTime,
                  firstDate: DateTime.now(),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onChanged: (DateTime? value) {
                    dateTime = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple),
                  ),
                  autofocus: false,
                  onPressed: () async {
                    if (newTaskTitle != null && newTaskTitle!.isNotEmpty && dateTime != null) {
                      print(newTaskTitle);
                      print(dateTime);
                      print(newTaskDetails);
                      Provider.of<SharedTask>(context, listen: false)
                          .addTask(
                          newTaskTitle!, dateTime!, id, newTaskDetails!);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      // backgroundColor: Colors.lightBlueAccent,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          )),
    );
  }
}
