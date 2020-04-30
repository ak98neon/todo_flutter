import 'package:flutter/material.dart';

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
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    readOnly: false,
                    showCursor: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                )
              ],
            ),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
