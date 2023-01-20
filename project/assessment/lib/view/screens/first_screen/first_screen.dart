import 'package:assessment/view/screens/second_screen/second_screen.dart';
import 'package:assessment/view/styles/styles.dart';
import 'package:assessment/view/widgets/custom_button.dart';
import 'package:assessment/view/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
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
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final palindromeController = TextEditingController();
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
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spacer(
                      flex: 10,
                    ),
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: CircleAvatar(),
                    ),
                    Spacer(
                      flex: 4,
                    ),
                    CustomTextField(
                      controller: nameController,
                      hint: 'Name',
                    ),
                    Spacer(),
                    CustomTextField(
                      controller: palindromeController,
                      hint: 'Palindrome',
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    CustomButton(
                      text: 'CHECK',
                      onPressed: () {
                        String original =
                            palindromeController.text.toLowerCase();
                        String reversed = palindromeController.text
                            .toLowerCase()
                            .split('')
                            .reversed
                            .join();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Palindrome',
                                style: title,
                              ),
                              content: Text(original == reversed
                                  ? 'The text is Palindrome'
                                  : 'The text is not Palindrome'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    Spacer(),
                    CustomButton(
                      text: 'NEXT',
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => SecondScreen()));
                      },
                    ),
                    Spacer(
                      flex: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
