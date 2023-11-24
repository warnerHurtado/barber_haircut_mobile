import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = true})
      : assert(selectedColor >= 0, 'Selected color must be greater than 0'),
        assert(selectedColor <= colorList.length,
            'Selected color must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true, colorSchemeSeed: colorList[selectedColor],
        brightness: isDarkMode ? Brightness.dark : Brightness.light,

        ///* Texts
        textTheme: TextTheme(
            titleLarge: GoogleFonts.montserratAlternates()
                .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
            titleMedium: GoogleFonts.montserratAlternates()
                .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
            titleSmall:
                GoogleFonts.montserratAlternates().copyWith(fontSize: 20)),
      );

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode);
}
