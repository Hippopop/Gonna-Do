class GonnaDo {
  
  String title;
  String? desc;
  DateTime? date;
  DateTime? time;
  bool status = false;
  bool alarm;
  Priority priority;

  GonnaDo({required this.title, required this.priority, required this.alarm});
}

enum Priority {
veryPoor,
poor,
midium,
strong,
veryStrong
}
