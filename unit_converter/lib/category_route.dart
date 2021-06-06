import 'package:flutter/material.dart';
import 'package:unit_converter/category.dart';

class CategoryProps {
  final String name;
  final Color color;

  const CategoryProps({required this.name, required this.color});
}

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute({Key? key, this.backgroundColor}) : super(key: key);

  final Color? backgroundColor;

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

  Widget _buildCategories() {
    final categories = _categoryProps
        .map((e) => Category(name: e.name, color: e.color, icon: Icons.cake))
        .toList();

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) => categories[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    final listView = Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      color: backgroundColor,
      child: _buildCategories(),
    );

    final appBar = AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: backgroundColor,
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
