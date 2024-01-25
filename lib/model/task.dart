import 'dart:core';

class Task{
    String? name;
    String? details;
  bool isDone;
  DateTime? date;
  int? id;

  Task({this.name,this.isDone=false,this.date,required this.id , required this.details});

  void isFinished(){
    isDone=!isDone;
  }
}