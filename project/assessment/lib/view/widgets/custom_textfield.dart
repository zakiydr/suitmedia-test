import 'package:assessment/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatefulWidget {
  final String? hint;

  const CustomTextField({super.key, this.hint});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      key: formKey,
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
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
    );
  }
}
