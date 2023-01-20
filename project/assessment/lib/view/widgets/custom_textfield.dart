import 'package:assessment/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final VoidCallback? press;

  const CustomTextField({super.key, this.hint, this.controller, this.press});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textAlignVertical: TextAlignVertical.center,
      style: defaultTextfieldStyle,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.white)),
        isCollapsed: true,
        hintText: widget.hint,
        fillColor: Colors.white,
        hintStyle: defaultTextfieldStyle.copyWith(color: Colors.grey),
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      onChanged: (value) {
        widget.press;
      },
    );
  }
}
