
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeData>{

  ThemeCubit(ThemeData selectedTheme) : super(selectedTheme);
  static const String _themeKey = 'selected_theme';

  static final _lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.pink,
        brightness: Brightness.light
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
  );

  static final _darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.pink,
        brightness: Brightness.dark
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
  );

  void changeTheme(){
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
    _saveSelectedThemeToPreferences();
  }

  bool isDarkTheme(){
    return state.brightness == Brightness.dark;
  }

  Future<void> _saveSelectedThemeToPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final themeName = isDarkTheme() ? 'dark' : 'light';
    await prefs.setString(_themeKey, themeName);
  }


  // Load the selected theme from SharedPreferences
  static Future<ThemeData> loadSelectedThemeFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final themeName = prefs.getString(_themeKey) ?? 'light';
    if (themeName == 'dark') {
      return _darkTheme;
    } else {
      return _lightTheme;
    }
  }

}