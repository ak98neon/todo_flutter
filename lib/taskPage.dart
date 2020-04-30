import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HabitsRow(),
            DaysList(),
          ],
        ),
      ),
    );
  }
}

class HabitsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
  int doneCount = 0;
  int totalCount = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Column(
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            elevation: 2.0,
            fillColor: Colors.white,
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.today,
                  size: 40.0,
                ),
                Text('$doneCount/$totalCount'),
              ],
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
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
  final int doneCount = 0;
  final int totalCount = 2;

  DayWidget(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, bottom: 10.0, top: 10.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChipTheme(
                  data: ChipTheme.of(context)
                      .copyWith(backgroundColor: Colors.transparent),
                  child: Chip(
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    label: Text('$doneCount/$totalCount'),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
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
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Theme(
            child: Checkbox(
              value: isDone,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: (bool value) {
                setState(() {
                  isDone = value;
                });
              },
            ),
            data: ThemeData(
              unselectedWidgetColor: Colors.indigo.shade500,
            ),
          ),
          Text("Task 1")
        ],
      ),
    );
  }
}
