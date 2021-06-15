// You can read about packages here: https://flutter.io/using-packages/
import 'package:flutter/material.dart';

import 'category_route.dart';

/// The function that is called when main.dart is run.
void main() => runApp(UnitConverterApp());

/// This widget is the root of our application.
/// The first screen we see is a list [Categories], each of which
/// has a list of [Unit]s.
class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      theme: ThemeData(
        // TODO: fill in the fontFamily property
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
              displayColor: Colors.grey[600],
            ),
        primaryColor: Colors.grey[500],
      ),
      home: CategoryRoute(),
    );
  }
}
