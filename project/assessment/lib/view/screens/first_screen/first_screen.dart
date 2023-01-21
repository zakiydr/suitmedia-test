import 'package:assessment/view/screens/second_screen/second_screen.dart';
import 'package:assessment/view/styles/styles.dart';
import 'package:assessment/view/widgets/custom_button.dart';
import 'package:assessment/view/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                    Container(
                      height: 120,
                      width: 120,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            AssetImage('assets/images/ic_photo.png'),
                      ),
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
                                'Palindrome Check',
                                style: title,
                              ),
                              content: Text(original.isEmpty
                                  ? 'Text is empty'
                                  : original == reversed
                                      ? 'The text is Palindrome'
                                      : 'The text is not Palindrome'),
                              // Text(original == reversed
                              //     ? 'The text is Palindrome'
                              //     : 'The text is not Palindrome'),
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
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('name', nameController.text);
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
