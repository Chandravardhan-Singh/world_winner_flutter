import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.controller,
    required this.label,
    this.disable = false,
    required this.validator,
    this.keyboardType = TextInputType.none,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String label;
  final bool disable;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      scrollPadding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      enabled: !disable,
      controller: controller,
      autocorrect: false,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        filled: true,
        enabled: !disable,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        fillColor:
            disable ? const Color.fromRGBO(239, 239, 239, 1) : Colors.white,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        focusColor: Colors.black87,
        floatingLabelStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
          borderSide: const BorderSide(
            color: Colors.black87,
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
          borderSide: const BorderSide(
            color: Colors.black87,
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
      ),
    );
  }
}
