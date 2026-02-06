import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tasks_app/app/app.bottomsheets.dart';
import 'package:tasks_app/app/app.locator.dart';
import 'package:tasks_app/enums/task_piriority.dart';
import 'package:tasks_app/models/task.dart';
import 'package:tasks_app/services/tasks_service.dart';

class CreateTaskSheetModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final _taskService = locator<TasksService>();
  TaskPiriority piriority = TaskPiriority.mustDoNow;
  DateTime _selectedDate = DateTime.now();
  String get selectedDate =>
      DateFormat('MMM d, y | HH:mm').format(_selectedDate);

  Future<void> selectDate() async {
    final result = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.chooseDate);
    if (result?.confirmed == true) {
      _selectedDate = result?.data;
      rebuildUi();
    }
  }

  Future<void> selectPiriority() async {
    final result = await _bottomSheetService.showCustomSheet(
        data: piriority, variant: BottomSheetType.selectPiriority);
    if (result?.confirmed == true) {
      piriority = result?.data;
      rebuildUi();
    }
  }

  createTask(dynamic Function(SheetResponse<dynamic>) completer) async {
    try {
      setBusy(true);
      final task = Task(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: titleController.text,
          dueDate: _selectedDate,
          piriority: piriority,
          description: noteController.text,
          createdAt: DateTime.now(),
          isDone: false);
      await _taskService.addTask(task);

      setBusy(false);
      completer(SheetResponse(confirmed: true));
    } catch (e) {
      log(e.toString());
      setBusy(false);
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }
}
