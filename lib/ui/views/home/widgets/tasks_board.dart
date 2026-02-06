import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks_app/models/task.dart';
import 'package:tasks_app/ui/common/app_styles.dart';
import 'package:tasks_app/ui/views/home/widgets/task_widget.dart';
import 'package:tasks_app/ui/widgets/custom_text.dart';
import 'package:tasks_app/ui/widgets/scaled_fade_load_widget.dart';

class TasksBoard extends StatelessWidget {
  const TasksBoard({
    super.key,
    required this.taskList,
    required this.motivationText,
    required this.onDelete,
    required this.onChecked,
  });

  final List<Task> taskList;
  final String motivationText;
  final Function(Task task) onDelete;
  final Function(Task task, bool isDone) onChecked;
  @override
  Widget build(BuildContext context) {
    return ScaledFadeLoadWidget(
      child: ClipRRect(
        borderRadius: AppStyles.borderRadiusLarge,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 18, 18, 4).withValues(alpha: 0.3),
                borderRadius: AppStyles.borderRadiusLarge,
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                  width: 1.5,
                )),
            child: Column(
              children: [
                const SizedBox(height: 46),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: CustomText.titleMedium(
                    text: motivationText,
                    textAlign: TextAlign.center,
                    textColor: Colors.white,
                    fontFamily: GoogleFonts.aBeeZee().fontFamily,
                  ),
                ),
                const SizedBox(height: 18),
                Expanded(
                    child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return TaskWidget(
                      task: taskList[index],
                      onDelete: () {
                        onDelete(taskList[index]);
                      },
                      onChanged: (bool p1) {
                        onChecked(taskList[index], p1);
                      },
                    );
                  },
                  itemCount: taskList.length,
                )),
                const SizedBox(height: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
