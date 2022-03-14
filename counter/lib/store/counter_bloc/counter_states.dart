abstract class CounterStates {}

class CounterInitialState extends CounterStates {}

class CounterMinusState extends CounterStates {
  final int currentCounter;

  CounterMinusState(this.currentCounter);
}

class CounterPlusState extends CounterStates {
  final int currentCounter;

  CounterPlusState(this.currentCounter);
}
