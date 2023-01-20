import 'package:assessment/view/screens/first_screen/first_screen.dart';
import 'package:assessment/view/screens/second_screen/second_screen.dart';
import 'package:assessment/view/screens/third_screen/third_screen.dart';
import 'package:assessment/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Suitmedia Assessment',
      theme: ThemeData(
        appBarTheme: defaultAppBarTheme,
        textTheme: GoogleFonts.poppinsTextTheme(),
        backgroundColor: Colors.white,
      ),
      home: const FirstScreen(),
    );
  }
}
