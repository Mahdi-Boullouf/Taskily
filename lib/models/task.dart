import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasks_app/enums/task_piriority.dart';

class Task {
  final String id;
  final String title;
  final String description;
  final TaskPiriority piriority;
  final DateTime createdAt;
  final DateTime dueDate;

  bool isDone;
  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.piriority,
    required this.createdAt,
    required this.dueDate,
    required this.isDone,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      piriority: TaskPiriority.values[map['piriority']],
      createdAt: map['createdAt'] is Timestamp
          ? map['createdAt'].toDate()
          : DateTime.parse(map['createdAt']),
      isDone: map['isDone'],
      dueDate: map['dueDate'] is Timestamp
          ? map['dueDate'].toDate()
          : DateTime.parse(map['dueDate']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'piriority': piriority.index,
      'createdAt': createdAt,
      'isDone': isDone,
      'dueDate': dueDate,
    };
  }

  Map<String, dynamic> toFireStoreMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'piriority': piriority.index,
      'createdAt': Timestamp.fromDate(createdAt),
      'isDone': isDone,
      'dueDate': Timestamp.fromDate(dueDate),
    };
  }
}
