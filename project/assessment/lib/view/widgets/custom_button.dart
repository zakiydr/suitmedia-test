import 'package:assessment/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  const CustomButton({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: () {},
          child: Text(text ?? 'null', style: defaultButtonTextStyle),
          style: defaultButtonStyle),
    );
  }
}
