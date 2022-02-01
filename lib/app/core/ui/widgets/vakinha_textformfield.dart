// Component = Text form field
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class VakinhaTextformfield extends StatelessWidget {
  // Customizing some elements
  final String label;
  final TextEditingController? controller;
  // Password gap
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;

  const VakinhaTextformfield({ Key? key,
    required this.label,
    this.controller,
    this.validator,
    this.onChange,
    this.obscureText = false // not sent? dafault = false : password
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChange,
      // Simplification from GetX
      cursorColor: context.theme.primaryColor,
      decoration: InputDecoration(
        isDense: true,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        errorStyle: const TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.grey[400]!)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.grey[400]!)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.grey[400]!)
        ),
        // background-color on textfield
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
