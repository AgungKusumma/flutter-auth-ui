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
  final _formKey = GlobalKey<FormState>();

  final _fullNameC = TextEditingController();
  final _emailC = TextEditingController();
  final _passwordC = TextEditingController();

  bool _isFormFilled = false;

  void _checkFormFilled() {
    setState(() {
      _isFormFilled = _fullNameC.text.isNotEmpty &&
          _emailC.text.isNotEmpty &&
          _passwordC.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _fullNameC.addListener(_checkFormFilled);
    _emailC.addListener(_checkFormFilled);
    _passwordC.addListener(_checkFormFilled);
    _checkFormFilled();
  }

  @override
  void dispose() {
    _fullNameC.dispose();
    _emailC.dispose();
    _passwordC.dispose();
    super.dispose();
  }

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
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        label: 'Full Name',
                        hint: 'Enter your full name here',
                        controller: _fullNameC,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 12.0),
                      CustomTextFormField(
                        label: 'Email',
                        hint: 'Enter your email here',
                        controller: _emailC,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 12.0),
                      CustomPasswordField(
                        label: 'Password',
                        hint: 'Enter your password here',
                        controller: _passwordC,
                      ),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            backgroundColor:
                                _isFormFilled ? Colors.blueAccent : Colors.grey,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: _isFormFilled
                              ? () {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Register Tapped'),
                                      ),
                                    );
                                  }
                                }
                              : null,
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
                            "Already have an account? ",
                            style: TextStyle(fontSize: 13),
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
