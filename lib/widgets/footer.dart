import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          SvgPicture.asset('assets/lock_icon.svg', height: 24),
          const SizedBox(height: 16),
          AppText.paragraph(
            "Your financial information is encrypted and secure. We'll never share or sell any of your personal data.",
            color: context.appColors.foregroundTertiary,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
