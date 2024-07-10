import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.child, this.onPressed})
      : isPrimary = true;

  const AppButton.secondary({super.key, required this.child, this.onPressed})
      : isPrimary = false;

  final Widget child;
  final VoidCallback? onPressed;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isPrimary
              ? context.appColors.backgroundAccent
              : context.appColors.backgroundPrimary,
          foregroundColor: isPrimary
              ? context.appColors.foregroundAlternative
              : context.appColors.foregroundAccent,
          side: BorderSide(width: 2, color: context.appColors.borderAccent),
          textStyle: AppTextStyles.button,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
