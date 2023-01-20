import 'dart:ui';

import 'package:flutter/material.dart';

//Colors
Color get defaultButtonColor => const Color(0xFF2B637B);

// Textfield Styles
TextStyle get defaultTextStyle =>
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
