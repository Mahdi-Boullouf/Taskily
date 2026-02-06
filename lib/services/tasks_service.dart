import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasks_app/models/task.dart';

class TasksService {
  final _db = FirebaseFirestore.instance.collection("tasks");

  Future<void> addTask(Task task) async {
    final taskDoc = _db.doc(task.id);
    await taskDoc.set(task.toFireStoreMap());
  }

  Future<List<Task>> getTasks() async {
    final sevenDaysAgo =
        Timestamp.fromDate(DateTime.now().subtract(const Duration(days: 7)));

    final data = await _db
        .where("dueDate", isGreaterThanOrEqualTo: sevenDaysAgo)
        .orderBy("dueDate") // ASCENDING by default
        .get();
    return data.docs.map((e) => Task.fromMap(e.data())).toList();
  }

  Future<void> updateTask(Task task, Map<String, dynamic> data) async {
    final taskDoc = _db.doc(task.id);
    final taskData = task.toFireStoreMap();
    for (var entry in data.entries) {
      taskData[entry.key] = entry.value;
    }
    await taskDoc.update(taskData);
  }

  Future<void> deleteTask(Task task) async {
    await _db.doc(task.id).delete();
  }
}
