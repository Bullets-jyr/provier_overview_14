import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provier_overview_14/counter.dart';

class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Text(
          '${context.watch<Counter>().counter}',
          style: TextStyle(fontSize: 52.0),
        ),
      ),
    );
  }
}
