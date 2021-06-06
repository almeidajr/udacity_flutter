import 'package:flutter/material.dart';
import 'package:unit_converter/category.dart';
import 'package:unit_converter/unit.dart';

class CategoryProps {
  final String name;
  final ColorSwatch color;

  const CategoryProps({required this.name, required this.color});
}

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatefulWidget {
  final Color? backgroundColor;

  const CategoryRoute({Key? key, this.backgroundColor}) : super(key: key);

  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  static const _categoryProps = <CategoryProps>[
    const CategoryProps(name: 'Length', color: Colors.teal),
    const CategoryProps(name: 'Area', color: Colors.orange),
    const CategoryProps(name: 'Volume', color: Colors.pinkAccent),
    const CategoryProps(name: 'Mass', color: Colors.blueAccent),
    const CategoryProps(name: 'Time', color: Colors.yellow),
    const CategoryProps(name: 'Digital Storage', color: Colors.greenAccent),
    const CategoryProps(name: 'Energy', color: Colors.purpleAccent),
    const CategoryProps(name: 'Currency', color: Colors.red),
  ];

  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  Widget _buildCategories() {
    final categories = _categoryProps.map((CategoryProps categoryProp) {
      return Category(
        name: categoryProp.name,
        color: categoryProp.color,
        icon: Icons.cake,
        units: _retrieveUnitList(categoryProp.name),
      );
    }).toList();

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) => categories[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    final listView = Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      color: widget.backgroundColor,
      child: _buildCategories(),
    );

    final appBar = AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: widget.backgroundColor,
      title: Text(
        'Unit Converter',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
