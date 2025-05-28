import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsPrivacyText extends StatefulWidget {
  const TermsPrivacyText({super.key});

  @override
  State<TermsPrivacyText> createState() => _TermsPrivacyTextState();
}

class _TermsPrivacyTextState extends State<TermsPrivacyText> {
  late TapGestureRecognizer _termsTapRecognizer;
  late TapGestureRecognizer _privacyTapRecognizer;

  @override
  void initState() {
    super.initState();

    _termsTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Terms & Conditions tapped'),
          ),
        );
      };

    _privacyTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Privacy Policy tapped'),
          ),
        );
      };
    ;
  }

  @override
  void dispose() {
    _termsTapRecognizer.dispose();
    _privacyTapRecognizer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 13),
          children: [
            const TextSpan(text: 'By logging in, you agree to the '),
            TextSpan(
              text: 'Terms & Conditions',
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              recognizer: _termsTapRecognizer,
            ),
            const TextSpan(text: ' and '),
            TextSpan(
              text: 'Privacy Policy',
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              recognizer: _privacyTapRecognizer,
            ),
            const TextSpan(text: ' of AuthApp.'),
          ],
        ),
      ),
    );
  }
}
