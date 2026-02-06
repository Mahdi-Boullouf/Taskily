import 'package:flutter/material.dart';
import 'package:tasks_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tasks_app/ui/widgets/custom_text.dart';

import 'select_piriority_sheet_model.dart';

class SelectPirioritySheet extends StackedView<SelectPirioritySheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const SelectPirioritySheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SelectPirioritySheetModel viewModel,
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
              CustomText.titleSmall(text: "Choose Piriority"),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    completer!(SheetResponse(confirmed: false));
                  },
                  icon: const Icon(Icons.close))
            ],
          ),
          ...List.generate(viewModel.piriority.length, (index) {
            return InkWell(
              onTap: () {
                viewModel.selectPiriority(viewModel.piriority[index]);
                completer!(SheetResponse(
                    confirmed: true, data: viewModel.selectedPiriority));
              },
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: viewModel.piriority[index].color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(viewModel.piriority[index].level),
                  const Spacer(),
                  Opacity(
                    opacity: viewModel.selectedPiriority ==
                            viewModel.piriority[index]
                        ? 1
                        : 0,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.check,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          verticalSpaceSmall
        ],
      ),
    );
  }

  @override
  void onViewModelReady(SelectPirioritySheetModel viewModel) {
    viewModel.selectPiriority(request.data);
    super.onViewModelReady(viewModel);
  }

  @override
  SelectPirioritySheetModel viewModelBuilder(BuildContext context) =>
      SelectPirioritySheetModel();
}
