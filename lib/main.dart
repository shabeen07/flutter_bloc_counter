// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc_observer/app_bloc_observer.dart';
import 'package:flutter_bloc_app/counter/counter.dart';
import 'package:flutter_bloc_app/theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const CounterBlocObserver();
  final selectedTheme = await ThemeCubit.loadSelectedThemeFromPreferences(); // load default theme from preference
  runApp(CounterApp(selectedTheme));
}
