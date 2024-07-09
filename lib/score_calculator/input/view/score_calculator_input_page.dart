import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
                style: GoogleFonts.workSans(
                  fontSize: 18,
                  height: 27 / 18,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF001C95),
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'financial wellness score.',
                    style: TextStyle(
                      fontSize: 20,
                      height: 24 / 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Card(
              color: Colors.white,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/score_icon.svg', height: 48),
                    const SizedBox(height: 16),
                    Text(
                      'Financial wellness test',
                      style: GoogleFonts.rubik(
                        fontSize: 20,
                        height: 24 / 20,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF1E2A32),
                      ),
                    ),
                    Text(
                      'Enter your financial information below',
                      style: GoogleFonts.workSans(
                        fontSize: 14,
                        height: 21 / 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF708797),
                      ),
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
            Text(
              "Your financial information is encrypted and secure. We'll never share or sell any of your personal data.",
              style: GoogleFonts.workSans(
                fontSize: 12,
                height: 18 / 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF8A9CA9),
              ),
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
          Row(
            children: [
              Text(
                'Annual income',
                style: GoogleFonts.workSans(
                  fontSize: 12,
                  height: 18 / 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF1E2A32),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              // you can also define different border styles for different states
              // e.g. when the field is enabled / focused / has error
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE9EEF2)),
              ),
              focusedBorder: const OutlineInputBorder(),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                'Monthly Costs',
                style: GoogleFonts.workSans(
                  fontSize: 12,
                  height: 18 / 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF1E2A32),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              // you can also define different border styles for different states
              // e.g. when the field is enabled / focused / has error
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE9EEF2)),
              ),
              focusedBorder: const OutlineInputBorder(),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF001C95),
                foregroundColor: Colors.white,
                textStyle: GoogleFonts.workSans(
                  fontSize: 16,
                  height: 16 / 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
