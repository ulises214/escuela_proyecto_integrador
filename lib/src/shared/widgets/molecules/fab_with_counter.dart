import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class FabWithCounter extends StatelessWidget {
  final Widget child;
  final int currentStep;
  final int stepCount;
  const FabWithCounter({
    Key? key,
    required this.child,
    required this.currentStep,
    required this.stepCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: FabWithCounterPainter(
        currentStep: currentStep,
        stepCount: stepCount,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}

class FabWithCounterPainter extends CustomPainter {
  final int currentStep;
  final int stepCount;
  FabWithCounterPainter({required this.currentStep, required this.stepCount});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = kTokenPrimaryColor
      ..strokeWidth = 0.5;
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..addOval(Rect.fromLTRB(size.width, size.height / 2, 0, size.height / 2));
    canvas.drawPath(path, paint);
    // canvas.drawArc(
    //   Rect.fromLTRB(0, 0, size.width, size.height),
    //   pi * 4,
    //   (pi * 2) / stepCount * currentStep,
    //   false,
    //   paint,
    // );
  }

  @override
  bool shouldRebuildSemantics(FabWithCounterPainter oldDelegate) => false;

  @override
  bool shouldRepaint(FabWithCounterPainter oldDelegate) => true;
  // oldDelegate.currentStep != currentStep ||
  // oldDelegate.stepCount != stepCount;
}
