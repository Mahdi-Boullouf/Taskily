import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tasks_app/ui/widgets/custom_text.dart';

class StartupAnimatedLogo extends HookWidget {
  const StartupAnimatedLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var secondAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 1000),
    );
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 900), () {
        secondAnimationController.repeat(reverse: true);
      });
      return null;
    }, []);
    return Center(
        child: FadeTransition(
            opacity: secondAnimationController,
            child: CustomText.titleLarge(
                text: "Taskily", textColor: Colors.white)));
  }
}
