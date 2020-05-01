import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class CreateTaskPage extends StatelessWidget {
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
          backgroundColor: Colors.white,
          body: Container(
            child: TaskActionWidget(),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class TaskActionWidget extends StatefulWidget {
  @override
  _TaskActionWidgetState createState() => _TaskActionWidgetState();
}

class _TaskActionWidgetState extends State<TaskActionWidget> {
  DateTime taskDate = DateTime.now();
  String taskName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
            onChanged: (String value) {
              taskName = value;
            },
          ),
        ),
        RawMaterialButton(
          onPressed: () {
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(2020, 1, 1),
                maxTime: DateTime(2030, 12, 31),
                onChanged: (date) {
                  print('change $date');
            },
                onConfirm: (date) {
              print('confirm $date');
              taskDate = date;
            }, currentTime: DateTime.now(), locale: LocaleType.en);
          },
          elevation: 2.0,
          fillColor: Colors.white,
          child: Column(
            children: <Widget>[
              Icon(
                Icons.date_range,
                size: 40.0,
                color: Colors.black,
              ),
            ],
          ),
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
        ),
        RawMaterialButton(
          onPressed: () {
            setState(() {
              createTask(taskName, taskDate);
            });
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TodoApp()),
            );
          },
          elevation: 2.0,
          fillColor: Colors.white,
          child: Column(
            children: <Widget>[
              Icon(
                Icons.create,
                size: 40.0,
                color: Colors.black,
              ),
            ],
          ),
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
        ),
      ],
    );
  }

  Future<String> createTask(String name, DateTime dateTime) async {
    final http.Response response = await http.post(
      'http://localhost:8080/v1/todo/tasks',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'description': name,
        'date': dateTime.toIso8601String(),
      }),
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return "ok";
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create task');
    }
  }
}
