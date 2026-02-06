import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasks_app/models/task.dart';
import 'package:tasks_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tasks_app/ui/widgets/custom_button.dart';
import 'package:tasks_app/ui/widgets/custom_text.dart';

import 'task_details_sheet_model.dart';

class TaskDetailsSheet extends StackedView<TaskDetailsSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const TaskDetailsSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TaskDetailsSheetModel viewModel,
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
              Expanded(
                child: CustomText.titleSmall(
                  text: viewModel.task?.title ?? '',
                  maxLines: 2,
                ),
              ),
              IconButton(
                  onPressed: () {
                    completer!(SheetResponse(confirmed: false));
                  },
                  icon: const Icon(Icons.close))
            ],
          ),
          verticalSpaceSmall,
          CustomText.bodySmallBold(text: "Description"),
          verticalSpaceSmall,
          CustomText.bodySmall(text: viewModel.task?.description ?? ''),
          verticalSpaceSmall,
          CustomText.bodySmallBold(text: "Due Date"),
          verticalSpaceSmall,
          CustomText.bodySmall(
              text: DateFormat('MMM d, y | HH:mm')
                  .format(viewModel.task?.dueDate ?? DateTime.now())),
          verticalSpaceSmall,
          CustomText.bodySmallBold(text: "Piriority"),
          verticalSpaceSmall,
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: viewModel.task?.piriority.color.withValues(alpha: .9),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              CustomText.bodySmall(text: viewModel.task?.piriority.name ?? ''),
            ],
          ),
          verticalSpaceMedium,
          Row(
            spacing: 4,
            children: [
              Expanded(
                child: CustomButton.outlined(
                  foregroundColor: Colors.redAccent,
                  onPressed: () {
                    completer!(SheetResponse(confirmed: true, data: "delete"));
                  },
                  text: "Delete",
                ),
              ),
              Expanded(
                child: CustomButton.filled(
                  foregroundColor: Colors.white,
                  onPressed: () {
                    completer!(SheetResponse(confirmed: true, data: "done"));
                  },
                  text: "Mark as ${viewModel.task!.isDone ? "undone" : "done"}",
                ),
              ),
            ],
          ),
          verticalSpaceSmall,
        ],
      ),
    );
  }

  @override
  void onViewModelReady(TaskDetailsSheetModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
    viewModel.task = request.data as Task;
  }

  @override
  TaskDetailsSheetModel viewModelBuilder(BuildContext context) =>
      TaskDetailsSheetModel();
}
