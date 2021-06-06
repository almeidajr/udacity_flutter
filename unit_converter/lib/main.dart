// You can read about packages here: https://flutter.io/using-packages/
import 'package:flutter/material.dart';
import 'package:unit_converter/category_route.dart';

/// The function that is called when main.dart is run.
void main() => runApp(UnitConverterApp());

final _backgroundColor = Colors.green[100];

/// This widget is the root of our application.
class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: CategoryRoute(
        backgroundColor: _backgroundColor,
      ),
    );
  }
}
