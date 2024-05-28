import 'package:flutter/material.dart';

class ATextField extends StatelessWidget {
  const ATextField({
    super.key,
    this.controller,
    this.isPassword = false,
    this.prefixIcon,
    this.hintText,
    this.textInputAction,
    this.labelText,
  });

  final TextEditingController? controller;
  final bool isPassword;
  final Icon? prefixIcon;
  final String? hintText;
  final String? labelText;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 1.2),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: prefixIcon,
          prefixIconConstraints: const BoxConstraints(minWidth: 32.0),
          hintText: hintText,
          labelText: labelText,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        textInputAction: textInputAction,
      ),
    );
  }
}
