import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks_app/ui/common/app_colors.dart';
import 'package:tasks_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tasks_app/ui/widgets/custom_button.dart';
import 'package:tasks_app/ui/widgets/custom_text.dart';

import 'choose_date_sheet_model.dart';

class ChooseDateSheet extends StackedView<ChooseDateSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ChooseDateSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChooseDateSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CustomText.titleSmall(text: "Choose Date"),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    completer!(SheetResponse(confirmed: false));
                  },
                  icon: const Icon(Icons.close))
            ],
          ),
          SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                use24hFormat: true,
                initialDateTime: DateTime.now(),
                showTimeSeparator: true,
                onDateTimeChanged: (v) {
                  viewModel.onDateChanged(v);
                },
              )),
          CustomButton.filled(
            foregroundColor: AppColors.white,
            onPressed: () {
              completer!(
                  SheetResponse(confirmed: true, data: viewModel.selectedDate));
            },
            text: "Confirm",
          ),
          verticalSpaceSmall
        ],
      ),
    );
  }

  @override
  ChooseDateSheetModel viewModelBuilder(BuildContext context) =>
      ChooseDateSheetModel();
}
