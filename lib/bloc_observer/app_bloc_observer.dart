
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class CounterBlocObserver extends BlocObserver{
  const CounterBlocObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit && kDebugMode) {
      print(change);
    }
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc,
      Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print(transition);
    }
  }
}