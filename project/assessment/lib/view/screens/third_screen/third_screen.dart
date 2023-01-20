import 'package:assessment/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Third Screen',
          style: title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue,
                  child: Text('A'),
                ),
                title: Text('FirstName ' + 'LastName'),
                subtitle: Text('Email'),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 5,
                color: Colors.grey,
              );
            },
            itemCount: 10),
      ),
    );
  }
}
