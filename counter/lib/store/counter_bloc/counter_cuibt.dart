import 'package:bloc/bloc.dart';
import 'package:counter/store/counter_bloc/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of(context);

  int counter = 1;

  void increment() {
    ++counter;
    emit(CounterPlusState(counter));
  }

  void decrement() {
    --counter;
    emit(CounterPlusState(counter));
  }
}
