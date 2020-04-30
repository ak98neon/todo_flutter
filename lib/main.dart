import 'package:flutter/material.dart';
import 'package:todo_flutter/models/nav_drawer.dart';
import 'package:todo_flutter/taskPage.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoApp',
      theme: ThemeData(
        brightness: Brightness.light,
        //Change your color here
        accentColor: Colors.blue,
        accentColorBrightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      home: SafeArea(
        child: Scaffold(
            drawer: NavDrawer(),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.black54,
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FloatingActionButton(
                child: const Icon(Icons.add, color: Colors.white,),
                onPressed: () {},
              ),
            ),
            backgroundColor: Colors.white,
            body: TaskPage()),
      ),
    );
  }
}
