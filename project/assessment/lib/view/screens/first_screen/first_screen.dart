import 'package:assessment/view/widgets/custom_button.dart';
import 'package:assessment/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: CircleAvatar(),
                  ),
                  CustomTextField(
                    hint: 'Name',
                  ),
                  CustomTextField(
                    hint: 'Palindrome',
                  ),
                  CustomButton(
                    text: 'CHECK',
                  ),
                  CustomButton(
                    text: 'NEXT',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
