import 'package:counter/store/counter_bloc/counter_cuibt.dart';
import 'package:counter/store/counter_bloc/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter With Bloc'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: BlocProvider(
          create: (context) => CounterCubit(),
          child: BlocConsumer<CounterCubit, CounterStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    color: Colors.amber,
                    onPressed: () {
                      print('decrement');
                      CounterCubit.get(context).decrement();
                    },
                    child: const Text(
                      '-',
                      style: btnStyle,
                    ),
                  ),
                  Text(
                    '${CounterCubit.get(context).counter}',
                    style: txtStyle,
                  ),
                  MaterialButton(
                    color: Colors.amber,
                    onPressed: () {
                      print('increment');
                      CounterCubit.get(context).increment();
                    },
                    child: const Text(
                      '+',
                      style: btnStyle,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

const txtStyle = TextStyle(
  color: Colors.amber,
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const btnStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);
