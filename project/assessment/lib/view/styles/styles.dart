import 'dart:ui';

import 'package:flutter/material.dart';

// Appbar
AppBarTheme get defaultAppBarTheme => AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      shape: Border(
        bottom: BorderSide(color: Colors.black, width: 0.05),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
    );

//Colors
Color get defaultButtonColor => const Color(0xFF2B637B);

// Textfield Styles
TextStyle get defaultTextfieldStyle =>
    TextStyle(fontWeight: FontWeight.w500, fontSize: 16);

// Button Styles
ButtonStyle get defaultButtonStyle => ElevatedButton.styleFrom(
      backgroundColor: defaultButtonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      fixedSize: Size.fromHeight(41),
    );

TextStyle get defaultButtonTextStyle => const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );

// Text Styles

TextStyle get title => const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

TextStyle get h1 => const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

TextStyle get body1 => const TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );

TextStyle get mainText => const TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
