import 'package:flutter/material.dart';
import 'widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 5, 99, 125),
    brightness: Brightness.dark);

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        )),
        cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
        iconTheme:
            ThemeData().iconTheme.copyWith(color: kDarkColorScheme.secondary)),
    theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer,
        )),
        cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
        textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
              color: kColorScheme.onSecondaryContainer,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            )),
        iconTheme: ThemeData().iconTheme.copyWith(color: kColorScheme.primary)),
    home: const Expenses(),
  ));
}
