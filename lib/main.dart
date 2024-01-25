import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/shared_task.dart';
import 'package:todo_app/screens/loading_screen.dart';
import 'package:todo_app/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>SharedTask(),
      child: MaterialApp(
        home: LoadingScreen(),
        debugShowCheckedModeBanner:false ,
      ),
    );
  }
}
