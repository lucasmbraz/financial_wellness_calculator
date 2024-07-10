import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.child, this.onPressed});

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.appColors.backgroundAccent,
          foregroundColor: context.appColors.foregroundAlternative,
          textStyle: AppTextStyles.button,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
