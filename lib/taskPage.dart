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

class HabitsRow extends StatefulWidget {
  @override
  _HabitsRowState createState() => _HabitsRowState();
}

class _HabitsRowState extends State<HabitsRow> {
  List<Widget> habitList = [
    HabitWidget('Add', Colors.grey),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: habitList));
  }
}

class HabitWidget extends StatelessWidget {
  final String text;
  final MaterialColor backColor;

  HabitWidget(this.text, this.backColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Column(
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            elevation: 2.0,
            fillColor: backColor,
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.add,
                  size: 40.0,
                  color: Colors.white,
                ),
              ],
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              text,
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
                DayWidget("THIS WEEK", Colors.grey),
                DayWidget("LATER", Colors.grey),
              ]),
        ));
  }
}

class DayWidget extends StatefulWidget {
  String text;
  MaterialColor color;

  DayWidget(this.text, this.color);

  @override
  _DayWidgetState createState() => _DayWidgetState(text, color);
}

class _DayWidgetState extends State<DayWidget> {
  final String text;
  final MaterialColor color;
  int doneCount = 0;
  int totalCount = 2;
  List<TaskWidget> taskList = [];

  _DayWidgetState(this.text, this.color) {
    this.totalCount = taskList.length;
  }

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
            children: taskList,
          )
        ],
      ),
    );
  }
}

class TaskWidget extends StatelessWidget {
  final String text;

  TaskWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Theme(
            child: TaskCheckBox(),
            data: ThemeData(
              unselectedWidgetColor: Colors.indigo.shade500,
            ),
          ),
          Text(text)
        ],
      ),
    );
  }
}

class TaskCheckBox extends StatefulWidget {
  @override
  _TaskCheckBoxState createState() => _TaskCheckBoxState();
}

class _TaskCheckBoxState extends State<TaskCheckBox> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isDone,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onChanged: (bool value) {
        setState(() {
          isDone = value;
        });
      },
    );
  }
}
