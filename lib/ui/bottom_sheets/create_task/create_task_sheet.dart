import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tasks_app/ui/widgets/custom_button.dart';
import 'package:tasks_app/ui/widgets/custom_input.dart';
import 'package:tasks_app/ui/widgets/custom_text.dart';

import 'create_task_sheet_model.dart';

class CreateTaskSheet extends StackedView<CreateTaskSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const CreateTaskSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateTaskSheetModel viewModel,
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
          const Text(
            'Create Your Task',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomInput(
            hintText: 'Task Name',
            onChanged: (value) {
              viewModel.rebuildUi();
            },
            controller: viewModel.titleController,
          ),
          const SizedBox(
            height: 8,
          ),
          CustomInput(
            hintText: 'Notes',
            controller: viewModel.noteController,
            maxLines: 3,
          ),
          verticalSpaceSmall,
          CustomText.bodySmall(text: "Due Date"),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: viewModel.selectDate,
            child: IgnorePointer(
              child: CustomInput(
                  hintText: viewModel.selectedDate,
                  controller: TextEditingController()),
            ),
          ),
          verticalSpaceSmall,
          CustomText.bodySmall(text: "Priority"),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: viewModel.selectPiriority,
            child: IgnorePointer(
              child: CustomInput(
                  hintText: viewModel.piriority.level,
                  controller: TextEditingController()),
            ),
          ),
          verticalSpaceMedium,
          CustomButton.filled(
            isDisabled:
                viewModel.isBusy || viewModel.titleController.text.isEmpty,
            onPressed: () {
              viewModel.createTask(completer!);
            },
            text: "Create",
            foregroundColor: Colors.white,
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  @override
  CreateTaskSheetModel viewModelBuilder(BuildContext context) =>
      CreateTaskSheetModel();
}
