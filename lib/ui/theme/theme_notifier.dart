import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TybaThemeNotifier with ChangeNotifier {
  ThemeData tybaTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromRGBO(4, 57, 51, 1),
    primaryColor: Color.fromRGBO(4, 57, 51, 1),
    cardColor: Color.fromRGBO(4, 57, 51, 1),
    primaryColorBrightness: Brightness.light,
    brightness: Brightness.light,
    focusColor: Color.fromRGBO(4, 57, 51, 1),
    errorColor: Color.fromRGBO(4, 57, 51, 1),
    appBarTheme: _getAppBarTheme(),
    colorScheme: _getColorScheme(),
  );

  static ColorScheme _getColorScheme() {
    return const ColorScheme.light(
      primary: Color.fromRGBO(28, 151, 130, 1),
      secondary: Color.fromRGBO(42, 253, 186, 1),
      primaryVariant: Color.fromRGBO(28, 151, 130, 1),
      secondaryVariant: Color.fromRGBO(42, 253, 186, 1),
      surface: Colors.white,
      background: Color.fromRGBO(4, 57, 51, 1),
      error: Color.fromRGBO(248, 122, 37, 1),
      onPrimary: Color.fromRGBO(28, 151, 130, 1),
      onSecondary: Color.fromRGBO(42, 253, 186, 1),
      onSurface: Colors.white,
      onError: Color.fromRGBO(248, 122, 37, 1),
      onBackground: Color.fromRGBO(4, 57, 51, 1),
    );
  }

  static AppBarTheme _getAppBarTheme() {
    return const AppBarTheme(
      color: Color.fromRGBO(4, 57, 51, 1),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }
}
