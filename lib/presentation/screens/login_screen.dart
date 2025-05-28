import 'package:authapp/presentation/widgets/custom_password_field.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_form_field.dart';
import '../widgets/terms_privacy_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/header_image.png',
                width: double.infinity,
                height: screenHeight * 0.3,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  child: Column(
                    children: [
                      const CustomTextFormField(
                        label: 'Email',
                        hint: 'Enter your email here',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const CustomPasswordField(
                        label: 'Password',
                        hint: 'Enter your password here',
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            'Forget Password?',
                            style: TextStyle(color: Colors.blue, fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            backgroundColor: Colors.blueAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Login'),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      const TermsPrivacyText(),
                      const SizedBox(height: 32.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            style: TextStyle(fontSize: 13),
                            "Doesn't have an account? ",
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'register');
                            },
                            child: const Text(
                              'Register here',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
