import 'package:flutter/material.dart';
/*

class ss extends StatelessWidget {
  final String title;
  final String description;
  final String Date;
  final bool isDone;

  const Task({Key key, this.title, this.description, this.isDone, this.Date}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){
          showModalBottomSheet(context: context, builder: (context){
            return Container(

            );
          });
        },
        title:
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),

        ),


        subtitle: Text(description+"\n"+Date),

        tileColor: Colors.amberAccent[200],
        trailing: isDone? Icon(Icons.check_circle_sharp,color: Colors.green): Icon(null),

      ),
   
    );
  }
}
*/

class Task extends StatefulWidget {
  String title;
  String description;
  String Date;
  bool isDone;

  Task({Key key, this.title, this.description, this.isDone, this.Date})
      : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.indigo[600],
              builder: (context) {
                return Container(
                    child: Column(
                       children: <Widget>[
                         Padding(
                         padding: const EdgeInsets.all(0.0),
                         child: Container(
                             child: Align(
                                 alignment: Alignment.topLeft,
                                 child:Icon(
                                   Icons.description,color: Colors.red,
                                   size: 50.0,
                                 )

                             )),
                       ),
                       Padding(
                          padding: const EdgeInsets.all(35.0),
                        child: Container(

                          child: Align(
                             alignment: Alignment.center,
                             child: Text(widget.title+"\n-----------------------",
                            style: new TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold,color:Colors.white)),
                      )
                        ),

                    ),

                         Padding(
                           padding: const EdgeInsets.all(35.0),
                           child: Container(
                               //color: Colors.wight,
                               child: Align(

                                 alignment: Alignment.centerLeft,
                                 child: Text(widget.description, style: new TextStyle(
                                     fontSize: 20.0, fontWeight: FontWeight.bold)
                                     ),
                               )),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(30.0),
                           child: Container(
                               child: Align(
                                 alignment: Alignment.bottomCenter,
                                 child: Text(
                                     widget.Date,  style: new TextStyle(
                                     fontSize: 20.0, fontWeight: FontWeight.bold,color:Colors.white)
                                     ),
                               )),
                         ),
                  ],
                ));
              });
        },
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: (Text("Deadline:  " + widget.Date,
            style: TextStyle(
              color: Colors.red,
            ))),
        tileColor: Colors.amberAccent[200],
        trailing: widget.isDone
            ? Icon(Icons.check_circle_sharp, color: Colors.green)
            : Icon(null),
      ),
    );
  }
}

