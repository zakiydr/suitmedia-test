import 'package:assessment/view/screens/third_screen/third_screen.dart';
import 'package:assessment/view/styles/styles.dart';
import 'package:assessment/view/widgets/custom_button.dart';
import 'package:assessment/view_model/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context).data;
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen', style: title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: body1,
                    ),
                    Text(
                      'John Doe',
                      style: h1,
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Text(
                '',
                style: mainText,
              ),
            ),
            CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ThirdScreen(),
                  ),
                );
              },
              text: 'Choose a User',
            ),
          ],
        ),
      ),
    );
  }
}
