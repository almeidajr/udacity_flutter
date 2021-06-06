import 'package:flutter/material.dart';
import 'package:unit_converter/unit.dart';

class ConverterRoute extends StatelessWidget {
  final List<Unit> units;
  final Color color;

  const ConverterRoute({Key? key, required this.units, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final unitWidgets = units
        .map((Unit unit) => Container(
              color: color,
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    unit.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    'Conversion: ${unit.conversion}',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ))
        .toList();

    return ListView(
      children: unitWidgets,
    );
  }
}
