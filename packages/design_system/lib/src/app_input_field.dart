import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class AppInputField extends StatelessWidget {
  const AppInputField({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.description(label),
        const SizedBox(height: 8),
        TextFormField(
          inputFormatters: [ThousandsFormatter()],
          keyboardType: TextInputType.number,
          style: AppTextStyles.lgHeadingSmall.copyWith(
            color: context.appColors.foregroundSecondary,
          ),
          initialValue: '0',
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 12, right: 8),
              child: SvgPicture.asset(
                'packages/design_system/lib/assets/dollar_icon.svg',
              ),
            ),
            prefixIconConstraints: const BoxConstraints.tightFor(height: 24),
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.appColors.borderPrimary),
            ),
            focusedBorder: const OutlineInputBorder(),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.appColors.borderNegative),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ],
    );
  }
}
