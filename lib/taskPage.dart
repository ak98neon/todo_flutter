import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HabitsRow(),
        DaysList(),
      ],
    );
  }
}

class HabitsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
        scrollDirection: Axis.horizontal,
        child: Row(children: <Widget>[
          HabitWidget(),
          HabitWidget(),
          HabitWidget(),
          HabitWidget(),
          HabitWidget(),
          HabitWidget(),
        ]));
  }
}

class HabitWidget extends StatefulWidget {
  @override
  _HabitState createState() => _HabitState();
}

class _HabitState extends State<HabitWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            elevation: 2.0,
            fillColor: Colors.white,
            child: Icon(
              Icons.today,
              size: 40.0,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Some description",
              style: TextStyle(fontSize: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}

class DaysList extends StatefulWidget {
  @override
  _DaysListState createState() => _DaysListState();
}

class _DaysListState extends State<DaysList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        scrollDirection: Axis.vertical,
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DayWidget("TODAY", Colors.lightBlue),
                DayWidget("TOMORROW", Colors.lightBlue),
                DayWidget("FUTURE", Colors.grey),
              ]),
        ));
  }
}

class DayWidget extends StatelessWidget {
  final String text;
  final MaterialColor color;


  DayWidget(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          Column(
            children: <Widget>[
              TaskWidget(),
              TaskWidget(),
              TaskWidget(),
            ],
          )
        ],
      ),
    );
  }
}

class TaskWidget extends StatefulWidget {
  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: false, onChanged: (bool value) {},
          ),
          Text(
            "Task 1"
          )
        ],
      ),
    );
  }
}
