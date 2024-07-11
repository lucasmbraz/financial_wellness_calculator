import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:kalshi_score/extensions/extensions.dart';
import 'package:kalshi_score/models/models.dart';

typedef OnSubmit = void Function(Money annualIncome, Money monthlyCost);

class ScoreInputForm extends StatefulWidget {
  const ScoreInputForm({super.key, required this.onSubmit});

  final OnSubmit onSubmit;

  @override
  State<ScoreInputForm> createState() => _ScoreInputFormState();
}

class _ScoreInputFormState extends State<ScoreInputForm> {
  final _formKey = GlobalKey<FormState>();

  double _annualIncome = 0;
  double _monthlyCosts = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          MoneyInputField(
            key: const Key('annualIncome'),
            label: 'Annual income',
            onSaved: (value) => _annualIncome = value ?? 0,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          MoneyInputField(
            key: const Key('monthlyCost'),
            label: 'Monthly Costs',
            onSaved: (value) => _monthlyCosts = value ?? 0,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 16),
          AppButton(
            key: const Key('continueButton'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.onSubmit(
                  _annualIncome.money,
                  _monthlyCosts.money,
                );
              }
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
