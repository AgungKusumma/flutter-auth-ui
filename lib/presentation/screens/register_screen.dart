import 'package:authapp/presentation/widgets/custom_password_field.dart';
import 'package:authapp/presentation/widgets/custom_text_form_field.dart';
import 'package:authapp/presentation/widgets/terms_privacy_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                'images/header_register.png',
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
                        label: 'Full Name',
                        hint: 'Enter your full name here',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      const CustomTextFormField(
                        label: 'Email',
                        hint: 'Enter your email here',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      const CustomPasswordField(
                        label: 'Password',
                        hint: 'Enter your password here',
                      ),
                      const SizedBox(
                        height: 16.0,
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
                          child: const Text('Register'),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      const TermsPrivacyText(
                        textPrefix: 'By registering, you agree to the ',
                      ),
                      const SizedBox(height: 32.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            style: TextStyle(fontSize: 13),
                            "Already have an account? ",
                          ),
                          InkWell(
                            onTap: () {
                              context.pop();
                            },
                            child: const Text(
                              'Login here',
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
