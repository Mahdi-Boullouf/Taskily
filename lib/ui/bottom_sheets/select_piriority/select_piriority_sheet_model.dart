import 'package:stacked/stacked.dart';
import 'package:tasks_app/enums/task_piriority.dart';

class SelectPirioritySheetModel extends BaseViewModel {
  final piriority = TaskPiriority.values;
  TaskPiriority selectedPiriority = TaskPiriority.mustDoNow;

  void selectPiriority(TaskPiriority piriority) {
    selectedPiriority = piriority;
    rebuildUi();
  }
}
