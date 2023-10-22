
import 'package:bloc/bloc.dart';

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {} // calls when increment count

class DecrementEvent extends CounterEvent {} // calls when decrement count

class CounterBloc extends Bloc<CounterEvent,int>{

  CounterBloc() : super(10) { // set initial value to 10
    on<IncrementEvent>((event, emit) => emit(state+1));
    on<DecrementEvent>((event,emit) => emit(state-1));
  }

}