import 'package:flutter/material.dart';
import 'package:tasks_app/ui/common/ui_helpers.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class AnimatedUpperWave extends StatelessWidget {
  const AnimatedUpperWave({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 3.141592653589793,
      child: WaveWidget(
          config: CustomConfig(colors: [
            const Color(0xFF7C6AE6), // muted purple
            const Color(0xFF5A4FCF), // deep indigo
          ], durations: [
            5000,
            3000
          ], heightPercentages: [
            0.25,
            0.35
          ]),
          size: Size(double.infinity, screenHeight(context) * 0.8)),
    );
  }
}
