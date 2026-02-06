// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/choose_date/choose_date_sheet.dart';
import '../ui/bottom_sheets/create_task/create_task_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/bottom_sheets/select_piriority/select_piriority_sheet.dart';
import '../ui/bottom_sheets/task_details/task_details_sheet.dart';

enum BottomSheetType {
  notice,
  createTask,
  chooseDate,
  selectPiriority,
  taskDetails,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.createTask: (context, request, completer) =>
        CreateTaskSheet(request: request, completer: completer),
    BottomSheetType.chooseDate: (context, request, completer) =>
        ChooseDateSheet(request: request, completer: completer),
    BottomSheetType.selectPiriority: (context, request, completer) =>
        SelectPirioritySheet(request: request, completer: completer),
    BottomSheetType.taskDetails: (context, request, completer) =>
        TaskDetailsSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
