import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provier_overview_14/counter.dart';
import 'package:provier_overview_14/show_me_counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Counter _counter = Counter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anonymous Route',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => ChangeNotifierProvider.value(
          value: _counter,
          child: MyHomePage(),
        ),
        '/counter': (context) => ChangeNotifierProvider.value(
          value: _counter,
          child: ShowMeCounter(),
        ),
      },
      // home: ChangeNotifierProvider<Counter>(
      //   create: (context) => Counter(),
      //   child: const MyHomePage(),
      // ),
    );
  }

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(
                'Show Me Counter',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/counter');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (_) {
                //     // return
                //     return ChangeNotifierProvider.value(
                //       value: context.read<Counter>(),
                //       child: ShowMeCounter(),
                //     );
                //   }),
                // );
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text(
                'Increment Counter',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                context.read<Counter>().increment();
              },
            ),
          ],
        ),
      ),
    );
  }
}
