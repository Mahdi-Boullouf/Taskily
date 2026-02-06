import 'package:tasks_app/app/app.locator.dart';
import 'package:tasks_app/extensions/date_extension.dart';
import 'package:tasks_app/models/task.dart';
import 'package:tasks_app/services/tasks_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _tasksService = locator<TasksService>();

  List<Task> todayTasks = [];
  List<Task> futureTasks = [];
  List<Task> pastTasks = [];

  final List<DateTime> _dates = [
    DateTime.now().subtract(const Duration(days: 1)),
    DateTime.now(),
    DateTime.now().add(const Duration(days: 1))
  ];
  List<DateTime> get dates => _dates;

  getTitle(index) {
    if (index == 0) {
      return 'Future';
    }
    if (index == 1) {
      return 'Today';
    }
    if (index == 2) {
      return 'Past';
    }
  }

  getMotivationText(int index) {
    if (index == 0) {
      return "Never Let The Past Dictate Your Future";
    }
    if (index == 1) {
      return "First Things First";
    }
    if (index == 2) {
      return "You didn't do it, but then what ?\nJust try again ";
    }
  }

  List<Task> getTasksList(int index) {
    if (index == 0) {
      return futureTasks;
    } else if (index == 1) {
      return todayTasks;
    } else {
      return pastTasks;
    }
  }

  deleteTask(Task task) async {
    setBusy(true);
    if (task.dueDate.isToday) {
      todayTasks.remove(task);
    } else if (task.dueDate.isInFuture) {
      futureTasks.remove(task);
    } else {
      pastTasks.remove(task);
    }
    notifyListeners();
    await _tasksService.deleteTask(task);
    setBusy(false);
  }

  setTaskStatus(Task task, bool status) async {
    setBusy(true);

    await _tasksService.updateTask(task, {"isDone": status});
    setBusy(false);
  }

  getTasks() async {
    setBusy(true);
    final tasks = await _tasksService.getTasks();
    todayTasks.clear();
    futureTasks.clear();
    pastTasks.clear();
    for (var task in tasks) {
      if (task.dueDate.isToday) {
        todayTasks.add(task);
      } else if (task.dueDate.isInFuture) {
        futureTasks.add(task);
      } else {
        pastTasks.add(task);
      }
    }
    setBusy(false);
  }
}
