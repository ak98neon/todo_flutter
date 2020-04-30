import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:todo_flutter/models/nav_drawer.dart';
import 'package:todo_flutter/taskPage.dart';

import 'createTask.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController scrollController;
  bool dialVisible = true;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController()
      ..addListener(() {
        setDialVisible(scrollController.position.userScrollDirection ==
            ScrollDirection.forward);
      });
  }

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  Padding buildSpeedDial() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        // child: Icon(Icons.add),
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        visible: dialVisible,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            child: Builder(
              builder: (context) =>
                  Center(
                    child: RawMaterialButton(
                        child: Icon(Icons.star, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateTaskPage()),
                          );
                        }),
                  ),
            ),
            backgroundColor: Colors.blue,
            onTap: () => {},
            label: 'Habit',
            labelStyle: TextStyle(fontWeight: FontWeight.w500),
            labelBackgroundColor: Colors.blue,
          ),
          SpeedDialChild(
            child: Builder(
              builder: (context) =>
                  Center(
                    child: RawMaterialButton(
                        child: Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateTaskPage()),
                          );
                        }),
                  ),
            ),
            backgroundColor: Colors.blue,
            onTap: () => {},
            label: 'Task',
            labelStyle: TextStyle(fontWeight: FontWeight.w500),
            labelBackgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }

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
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.black54,
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
              ),
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.endDocked,
            floatingActionButton: buildSpeedDial(),
            backgroundColor: Colors.white,
            body: TaskPage()),
      ),
    );
  }
}
