import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _defaultInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(color: ColorsApp.i.greyDart, width: 1));

  static final theme = ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black)),
      primaryColor: ColorsApp.i.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorsApp.i.primary,
        primary: ColorsApp.i.primary,
        secondary: ColorsApp.i.secondary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        contentPadding: EdgeInsets.all(13),
        labelStyle: TextStyles.i.labelTextField,
        border: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
      ));
}
