import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
  const MyTextFiled({
    super.key,
    this.controller,
    this.helperText,
    required this.onChanged,
    this.keyboardType,
    this.maxLines,
    this.verticalPadding,
    this.hint,
  });

  final int? maxLines;
  final double? verticalPadding;
  final String? helperText;
  final String? hint;
  final TextEditingController? controller;
  final void Function(String) onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This filed is required';
        } else {
          return null;
        }
      },
      textDirection: TextDirection.rtl,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: verticalPadding ?? 8,
        ),
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        helperText: helperText,
        hintText: hint,
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
      ),
    );
  }
}
