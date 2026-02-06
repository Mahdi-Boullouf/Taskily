import 'package:tasks_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:tasks_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:tasks_app/ui/views/home/home_view.dart';
import 'package:tasks_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tasks_app/ui/bottom_sheets/create_task/create_task_sheet.dart';
import 'package:tasks_app/services/tasks_service.dart';
import 'package:tasks_app/ui/bottom_sheets/choose_date/choose_date_sheet.dart';
import 'package:tasks_app/ui/bottom_sheets/select_piriority/select_piriority_sheet.dart';
import 'package:tasks_app/ui/bottom_sheets/task_details/task_details_sheet.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: TasksService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: CreateTaskSheet),
    StackedBottomsheet(classType: ChooseDateSheet),
    StackedBottomsheet(classType: SelectPirioritySheet),
    StackedBottomsheet(classType: TaskDetailsSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
