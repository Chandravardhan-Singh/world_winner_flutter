import 'package:flutter/material.dart';

void showCustomDialog({
  required BuildContext context,
  required Widget child,
}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.85),
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (_, __, ___) {
      return child;
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(
          begin: const Offset(0, 1),
          end: Offset.zero,
        );
      } else {
        tween = Tween(
          begin: const Offset(0, 1),
          end: Offset.zero,
        );
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: child,
      );
    },
  );
}
