// Screens
import 'package:flutter/material.dart';

class VakinhaUI {
  VakinhaUI._();
  static final ThemeData theme = ThemeData(
    primaryColor: const Color(0xFF007D21),
    primaryColorDark: const Color(0xFF00343F),
    fontFamily: 'mplus1',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF007D21),
        textStyle: const TextStyle(fontFamily: 'mplus1'),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // selected items and icons = black color
      selectedItemColor: Colors.black,
      selectedIconTheme: const IconThemeData(color: Colors.black),
      // when button is selected = bold
      selectedLabelStyle: textBold,
      // non-selected items and icons = grey
      unselectedItemColor: Colors.grey[400],
      unselectedIconTheme: IconThemeData(color: Colors.grey[400]),
    ),
  );

  // Creating a theme for not entering all the time 'fontWeight: FontWeight.Bold'
  static const TextStyle textBold = TextStyle(fontWeight: FontWeight.bold);
}