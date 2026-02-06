import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tasks_app/app/app.bottomsheets.dart';
import 'package:tasks_app/app/app.locator.dart';
import 'package:tasks_app/ui/views/home/widgets/animated_upper_wave.dart';
import 'package:tasks_app/ui/views/home/widgets/tasks_board.dart';
import 'package:tasks_app/ui/widgets/custom_text.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF7C6AE6),
          onPressed: () async {
            final result = await locator<BottomSheetService>()
                .showCustomSheet(variant: BottomSheetType.createTask);
            if (result?.confirmed == true) {
              viewModel.getTasks();
            }
          },
          child: const Icon(Icons.add, color: Colors.white)),
      body: Stack(
        children: [
          const AnimatedUpperWave(),
          PageView.builder(
              controller: PageController(
                viewportFraction: 0.8,
              ),
              scrollDirection: Axis.vertical,
              itemCount: viewModel.dates.length,
              onPageChanged: (value) {
                viewModel.rebuildUi();
              },
              itemBuilder: (context, indexPage) {
                final taskList = viewModel.getTasksList(indexPage);
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: kToolbarHeight + 5),
                        Expanded(
                            child: TasksBoard(
                                taskList: taskList,
                                motivationText:
                                    viewModel.getMotivationText(indexPage),
                                onDelete: (task) {
                                  viewModel.deleteTask(task);
                                },
                                onChecked: (task, isDone) {
                                  viewModel.setTaskStatus(task, isDone);
                                })),
                        SafeArea(
                            top: false,
                            child: CustomText.headlineLarge(
                                text: viewModel.getTitle(indexPage))),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.getTasks();
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
