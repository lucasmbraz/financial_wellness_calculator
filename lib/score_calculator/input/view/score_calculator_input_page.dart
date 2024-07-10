import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScoreCalculatorInputPage extends StatelessWidget {
  const ScoreCalculatorInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/logo.svg', height: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Let's find out your ",
                style: AppTextStyles.subtitle.copyWith(
                  color: context.appColors.foregroundAccent,
                ),
                children: [
                  TextSpan(
                    text: 'financial wellness score.',
                    style: AppTextStyles.subtitleLg,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/score_icon.svg', height: 48),
                    const SizedBox(height: 16),
                    AppText.headingSmall('Financial wellness test'),
                    AppText.paragraph(
                      'Enter your financial information below',
                      color: context.appColors.foregroundTertiary,
                    ),
                    const SizedBox(height: 16),
                    const _Form(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 36),
            SvgPicture.asset('assets/lock_icon.svg', height: 24),
            const SizedBox(height: 16),
            AppText.paragraph(
              "Your financial information is encrypted and secure. We'll never share or sell any of your personal data.",
              color: context.appColors.foregroundTertiary,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const AppInputField(label: 'Annual income'),
          const SizedBox(height: 16),
          const AppInputField(label: 'Monthly Costs'),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: AppButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}
