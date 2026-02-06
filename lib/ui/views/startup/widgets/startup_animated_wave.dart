import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tasks_app/ui/common/app_colors.dart';
import 'package:tasks_app/ui/common/ui_helpers.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class StartupAnimatedWave extends HookWidget {
  const StartupAnimatedWave({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var animationController = useAnimationController(
      duration: const Duration(milliseconds: 1800),
    )..forward();
    var animation = useAnimation(
      Tween<double>(begin: 0.0, end: 1.0).animate(animationController),
    );

    return Transform.rotate(
      angle: 3.141592653589793,
      child: WaveWidget(
          config: CustomConfig(colors: [
            AppColors.secondary, // muted purple
            AppColors.primary, // deep indigo
          ], durations: [
            1300,
            1200
          ], heightPercentages: [
            1 - animation - 0.2,
            1 - animation - 0.1
          ]),
          size: Size(double.infinity, screenHeight(context))),
    );
  }
}
