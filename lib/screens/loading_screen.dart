import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todo_app/model/shared_task.dart';
import 'package:todo_app/screens/tasks_screen.dart';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedTask taskData=SharedTask();
    taskData.getData().whenComplete(() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return TasksScreen();
    }
    )
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SpinKitFoldingCube(
        color: Colors.blue,
      ),
    );
  }
}
