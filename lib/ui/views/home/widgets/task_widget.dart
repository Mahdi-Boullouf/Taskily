import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tasks_app/app/app.bottomsheets.dart';
import 'package:tasks_app/app/app.locator.dart';
import 'package:tasks_app/models/task.dart';
import 'package:tasks_app/ui/widgets/custom_text.dart';
import 'package:tasks_app/ui/widgets/scaled_fade_load_widget.dart';

class TaskWidget extends HookWidget {
  const TaskWidget({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onDelete,
  });
  final Task task;
  final Function(bool) onChanged;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    final isDone = useState(task.isDone);
    useEffect(() {
      isDone.value = task.isDone;
      task.isDone = isDone.value;
      return null;
    }, [task]);
    return ScaledFadeLoadWidget(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Checkbox(
                side: const BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                checkColor: Colors.white,
                activeColor: Colors.transparent,
                value: isDone.value,
                onChanged: (value) {
                  isDone.value = value!;
                  onChanged(value);
                }),
            Expanded(
              flex: 8,
              child: InkWell(
                onTap: () async {
                  final result = await locator<BottomSheetService>()
                      .showCustomSheet(
                          variant: BottomSheetType.taskDetails, data: task);
                  if (result != null && result.confirmed) {
                    if (result.data == "delete") {
                      onDelete();
                    } else if (result.data == "done") {
                      isDone.value = !isDone.value;
                      task.isDone = !task.isDone;
                      onChanged(isDone.value);
                    }
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.bodyMedium(
                      text: task.title,
                      textColor: Colors.white,
                    ),
                    CustomText.bodySmall(
                      text: DateFormat('MMM d, y | HH:mm').format(task.dueDate),
                      textColor: Colors.white70,
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(flex: 1, child: SizedBox()),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                  border:
                      Border.fromBorderSide(BorderSide(color: Colors.white38))),
              child: CustomText.bodySmallBold(
                text: task.piriority.name,
                textColor: Colors.white70,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
