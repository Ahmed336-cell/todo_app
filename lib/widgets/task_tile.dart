import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskTile extends StatelessWidget{
  final bool? isChecked;
  final String? taskTitle;
  final String? taskDetails;
  final Function updateCallback;

  final Function? checkboxCallback;
  final Function longPressCallback;
  final String? timeLeft;
  TaskTile({this.isChecked=false, this.taskTitle,this.checkboxCallback,required this.longPressCallback,this.timeLeft,this.taskDetails,required this.updateCallback});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onLongPress: (){
            longPressCallback();
          },
          title: Text(
            "${taskTitle! }\n${taskDetails}",
            style: TextStyle(
              fontSize: 20,
              color: (timeLeft!)=='Time Expired'?Colors.red:isChecked! ? Colors.green: Colors.white,
            ),
          ),
          subtitle:Text(isChecked!?'Completed':(timeLeft!),style: TextStyle(
            color: (timeLeft!)=='Time Expired'?Colors.red:isChecked! ? Colors.green: Colors.white54,),),
          trailing:
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                activeColor: Colors.lightBlueAccent,
                value: isChecked,
                onChanged: (value){
                  checkboxCallback!(value);},
              ),
              IconButton(onPressed: (){
                updateCallback();
              }, icon: Icon(Icons.update , size: 25,))
            ],
          ),

        ),
        Divider(height: 10,)

      ],
    );
  }
}