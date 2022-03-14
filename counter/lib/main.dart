import 'package:bloc/bloc.dart';
import 'package:counter/screens/counter.dart';
import 'package:counter/store/bloc_observer.dart';
import 'package:counter/store/counter_bloc/counter_cuibt.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  BlocOverrides.runZoned(
    () {
      // Use cubits...
      CounterCubit();
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}
