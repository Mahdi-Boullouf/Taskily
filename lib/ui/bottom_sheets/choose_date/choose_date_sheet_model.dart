import 'package:stacked/stacked.dart';

class ChooseDateSheetModel extends BaseViewModel {
  DateTime selectedDate = DateTime.now();

  void onDateChanged(DateTime date) {
    selectedDate = date;
    rebuildUi();
  }
}
