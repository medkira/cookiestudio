import 'package:flutter/material.dart';
import 'package:cookiestudio/presentation/resources/color_manager.dart';
import 'package:cookiestudio/presentation/resources/font_manager.dart';
import 'package:cookiestudio/presentation/resources/styles_manager.dart';
import 'package:cookiestudio/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,

    //? main colors
    primaryColor: lightColorScheme.primary,
    primaryColorDark: darkColorScheme.primary,
    disabledColor: lightColorScheme.inversePrimary,

    // ? cardviw theme
    cardTheme: CardTheme(
        color: lightColorScheme.surface,
        shadowColor: lightColorScheme.shadow,
        elevation: AppSize.s1_5),
    // ? app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: lightColorScheme.primary,
        shadowColor: lightColorScheme.shadow,
        titleTextStyle: getRegularStyle(
            fontSize: FontSize.s24, color: lightColorScheme.onPrimary)),

    // ? text button
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: getMediumStyle(
          color: lightColorScheme.primary,
          fontSize: FontSize.s19,
        ),
      ),
    ),

    // ?button theme
    buttonTheme: ButtonThemeData(
        disabledColor: lightColorScheme.inversePrimary,
        buttonColor: lightColorScheme.primary),

    // ?elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getSemiBoldStyle(
          color: lightColorScheme.primary,
          fontSize: FontSize.s26,
        ),
        // backgroundColor: lightColorScheme.error,
      ),
    ),

    //? text theme
    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
          color: lightColorScheme.secondary,
          fontSize: FontSize.s28,
        ),
        titleMedium: getMediumStyle(
            color: lightColorScheme.primary, fontSize: FontSize.s18),
        titleSmall: getMediumStyle(
            color: lightColorScheme.primary, fontSize: FontSize.s18),
        titleLarge: getMediumStyle(
            color: lightColorScheme.onSurface, fontSize: FontSize.s18),
        bodySmall: getMediumStyle(
            color: lightColorScheme.outlineVariant, fontSize: FontSize.s15),
        bodyLarge: getMediumStyle(
            color: lightColorScheme.onBackground, fontSize: FontSize.s32),
        headlineLarge: getMediumStyle(
            color: lightColorScheme.onPrimary, fontSize: FontSize.s40),
        headlineMedium: getMediumStyle(
            color: lightColorScheme.onPrimaryContainer,
            fontSize: FontSize.s22)),

    // ?input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // ? content padding
      contentPadding: const EdgeInsets.all(AppPadding.p10),

      // ? hint style
      hintStyle: getRegularStyle(
          color: lightColorScheme.secondary, fontSize: FontSize.s16),

      // ? label style
      labelStyle: getMediumStyle(
          color: lightColorScheme.secondary, fontSize: FontSize.s16),

      // ? error style
      errorStyle: getRegularStyle(color: lightColorScheme.error),

      // ? enabel border style
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: lightColorScheme.secondary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s18)),
      ),

      // ? focused border style
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: lightColorScheme.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s18)),
      ),

      // ? error border style
      errorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: lightColorScheme.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s18)),
      ),

      // ? focused  error border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: lightColorScheme.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s18)),
      ),
    ),
  );
}
