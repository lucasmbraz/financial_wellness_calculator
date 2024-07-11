import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class AppInputField extends StatelessWidget {
  const AppInputField({super.key, required this.label, required this.onSaved});

  final String label;
  final FormFieldSetter<double> onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.description(label),
        const SizedBox(height: 8),
        TextFormField(
          onSaved: (value) => onSaved(value.toDouble()),
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
            if (value == null || value.isEmpty || value.toDouble() == 0) {
              return 'Please enter a value greater than zero';
            }
            return null;
          },
        ),
      ],
    );
  }
}

extension on String? {
  String _raw() {
    return this?.replaceAll(',', '').replaceAll('.', '') ?? '';
  }

  double toDouble() {
    return double.tryParse(_raw()) ?? 0;
  }
}
