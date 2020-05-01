class Task {
  int id;
  String name;
  String description;
  String date;

  Task({this.id, this.name, this.description, this.date});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      description: json['name'],
      date: json['date'],
    );
  }
}
