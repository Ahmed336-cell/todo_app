import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/model/task.dart';
import 'package:intl/intl.dart';

int id=0;
List<Task> _taskList=[];
DateTime now = DateTime.now();
class SharedTask extends ChangeNotifier{
  List<String>? task = [];
  List<String>?details=[];
  List<String>? boxValue = [];
  List<String>? dates=[];
  List<String>? uid=[];
  String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
  Future getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    task!.clear();
    boxValue!.clear();
    details!.clear();
    _taskList.clear();
    task = prefs.getStringList("task");
    details= prefs.getStringList("details");
    boxValue = prefs.getStringList("check");
    dates=prefs.getStringList("date");
    uid=prefs.getStringList("id");
    if(task==null) {
      task=["Long Press to clear tasks"];
      details=["None"];
      boxValue=["false"];
      dates=[formattedDate];
      uid=[id.toString()];
    }
    for(int i=0;i<boxValue!.length;i++){
      _taskList.add(Task(name: task![i],isDone: boxValue![i]=='true',date: DateTime.parse(dates![i]),id:int.parse(uid![i]),details: details![i]));
    }
    id=int.parse(uid!.last);
    id+=2;
    notifyListeners();
  }

  void setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    task!.clear();
    boxValue!.clear();
    dates!.clear();
    details!.clear();
    uid!.clear();
    for(int i=0;i<_taskList.length;i++){
      task!.add(_taskList[i].name!);
      details!.add(_taskList[i].details!);
      boxValue!.add(_taskList[i].isDone.toString());
      dates!.add(_taskList[i].date.toString());
      uid!.add(_taskList[i].id.toString());
    }
    await prefs.setStringList("task", task!);
    await prefs.setStringList("check", boxValue!);
    await prefs.setStringList("date", dates!);
    await prefs.setStringList("id", uid!);
    await prefs.setStringList("details", details!);
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_taskList);
  }

  void addTask(String t,DateTime d,int uid , String details){
    _taskList.add(Task(name: t,date: d,id: uid,details: details));
    setData();
    notifyListeners();
  }
  int get taskCount{
    return _taskList.length;
  }

  void updateTask(Task task){
    task.isFinished();
    setData();
    notifyListeners();
  }

  void changeDataTask(Task task,String title,DateTime d,String details){
    for (int i = 0; i < _taskList.length; i++) {
      if (_taskList[i].id == task.id) {
        // Update the properties of the task with matching id
        _taskList[i].name = title;
        _taskList[i].date = d;
        _taskList[i].details = details;

        // Save changes to SharedPreferences
        setData();
        notifyListeners();
        break; // Stop iterating after updating the task
      }
    }
  }

  void deleteTask(Task t){
    _taskList.remove(t);
    setData();
    notifyListeners();
  }
}