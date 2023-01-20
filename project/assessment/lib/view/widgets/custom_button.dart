import 'package:assessment/view/screens/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  const CustomButton({super.key, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text ?? 'null', style: defaultButtonTextStyle),
          style: defaultButtonStyle),
    );
  }
}
