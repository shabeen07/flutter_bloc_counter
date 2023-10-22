
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/counter/counter_page.dart';
import 'package:flutter_bloc_app/theme/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class CounterApp extends StatelessWidget{
  final ThemeData selectedTheme;
  const CounterApp(this.selectedTheme, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context){
        return ThemeCubit(selectedTheme);
      },
      child: const CounterAppView(),
    );
  }
}

class CounterAppView extends StatelessWidget {
  const CounterAppView({super.key});

  @override
  Widget build(BuildContext context) {
      return BlocBuilder<ThemeCubit,ThemeData>(
        builder: (context, theme) => MaterialApp(
          theme: theme,
          home: const CounterPage(),
        ),
      );
  }

}