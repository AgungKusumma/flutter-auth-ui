import 'package:authapp/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;

  const CustomPasswordField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      label: widget.label,
      hint: widget.hint,
      obscureText: _obscure,
      controller: widget.controller,
      suffixIcon: IconButton(
        iconSize: 20,
        icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
        onPressed: () {
          setState(() {
            _obscure = !_obscure;
          });
        },
      ),
    );
  }
}
