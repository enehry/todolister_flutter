import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolisterflutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    var text = TextEditingController();
    return Container(
      color: Color(0xff757575),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Center(
              child: Text('ADD TASK',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              )
                ,),
            )
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    textAlign: TextAlign.center,
                    autofocus: true,
                    onChanged: (x){
                      newTaskTitle = x;
                    },
                    controller: text,
                  ),
                  SizedBox(height: 20.0),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add,
                          color: Colors.white,
                          size: 15.0,
                        ),
                        Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    ),
                    color: Colors.deepOrange,
                    onPressed: (){
                      Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                      text.clear();
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
