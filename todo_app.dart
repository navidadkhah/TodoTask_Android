import 'package:flutter/material.dart';
import 'package:flutter_app123/task.dart';


class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  TextEditingController titleController;
  TextEditingController descriptionController;
  TextEditingController dateController;

  List<Task> _todoTasks = [

  ];

  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    dateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void _addTask(String title, String description, String date) {
    setState(() {
      _todoTasks.add(Task(
        title: title,
        description: description,
        Date: date,
        isDone: false,
      ));
    });
  }

  void _showBottonSheet(contex) {
    showModalBottomSheet(
        context: contex,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: 'Title:'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(labelText: 'Description:'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(labelText: 'Date:'),
                  ),
                ),
                ElevatedButton(onPressed: () {
                  _addTask(titleController.text, descriptionController.text,
                      dateController.text);
                  titleController.clear();
                  descriptionController.clear();
                  dateController.clear();
                  Navigator.pop(context);
                }, child: Text("Add"))
              ],
            ),
          );
        });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.grey[600],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green[900],
        onPressed: () {
          _showBottonSheet(context);
        },
      ),
      body: ListView.builder(
          itemCount: _todoTasks.length,
          itemBuilder: (context, int index) {
            return GestureDetector(

              onDoubleTap: () {
                setState(() {
                  Task oldTask = _todoTasks[index];
                  _todoTasks[index] = Task(
                    title: oldTask.title,
                    description: oldTask.description,
                    Date: oldTask.Date,
                    isDone: !oldTask.isDone,
                  );
                });
              },
              child: _todoTasks[index],

            );
          }),

    );
  }
}



