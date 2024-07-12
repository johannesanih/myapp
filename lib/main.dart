import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc.dart';

void main() => runApp(ToDoApp());

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
      create: (context) => CounterBloc(),
      child: MyHomePage(),
    ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Bloc example'),
        ),
        body: BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
          if (state is UpdatedState) {
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  const Text('Counter Value:', style: TextStyle(fontSize: 20)),
                  Text('${state.count}', style: const TextStyle(fontSize: 50)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: () => counterBloc.add(IncrementEvent()),
                        child: const Icon(Icons.add),
                      ),
                      FloatingActionButton(
                        onPressed: () => counterBloc.add(DecrementEvent()),
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                ]
              )
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
