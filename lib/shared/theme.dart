import 'package:flutter/material.dart';

ThemeData getGlobalTheme() {
  return ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3aac59)))
      .copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(shape: const StadiumBorder())));
}
