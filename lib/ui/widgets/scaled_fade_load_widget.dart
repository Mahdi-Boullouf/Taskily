import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ScaledFadeLoadWidget extends HookWidget {
  const ScaledFadeLoadWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var animationController = useAnimationController(
      duration: const Duration(milliseconds: 400),
    )..repeat(reverse: true);
    var fadeAnimation = useAnimation(
      Tween<double>(begin: 0.2, end: 1).animate(animationController),
    );
    var scale = useAnimation(
      Tween<double>(begin: 0.8, end: 1).animate(animationController),
    );

    useEffect(() {
      animationController.forward();
      return null;
    });
    return Transform.scale(
      scale: scale,
      child: Opacity(
        opacity: fadeAnimation,
        child: child,
      ),
    );
  }
}
