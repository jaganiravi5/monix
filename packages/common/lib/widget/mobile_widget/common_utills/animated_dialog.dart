import 'package:flutter/widgets.dart';

Future<bool> showAnimatedDialog(
  BuildContext context,
  Widget widget, {
  double maxWidth = 300.0, // Specify your desired maximum width
  bool? barrierDismissible,
}) async {
  bool? result = await showGeneralDialog(
    barrierLabel: 'label',
    transitionDuration: const Duration(milliseconds: 300),
    barrierDismissible: barrierDismissible ?? true,
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) => ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: widget,
    ),
    transitionBuilder: (context, animation, secondaryAnimation, child) =>
        ScaleTransition(
      scale: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeIn,
        ),
      ),
      child: child,
    ),
  );

  return result ?? false;
}
