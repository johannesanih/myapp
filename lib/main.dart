import 'package:flutter/material.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Counter App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage(title: 'Counter App'));
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center (
        child: Column (
          children: <Widget>[
            Text(_count.toString(), style: const TextStyle(fontSize: 40),),
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: _increment,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add)
                ),
                FloatingActionButton(
                  onPressed: _decrement,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove)
                )
              ],
            ),
          ],
        )
      )
    );
  }
}
