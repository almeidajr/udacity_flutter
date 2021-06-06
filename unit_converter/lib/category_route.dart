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
    const CategoryProps(
      name: 'Length',
      color: ColorSwatch(0xFF6AB7A8, {
        'highlight': Color(0xFF6AB7A8),
        'splash': Color(0xFF0ABC9B),
      }),
    ),
    const CategoryProps(
      name: 'Area',
      color: ColorSwatch(0xFFFFD28E, {
        'highlight': Color(0xFFFFD28E),
        'splash': Color(0xFFFFA41C),
      }),
    ),
    const CategoryProps(
      name: 'Volume',
      color: ColorSwatch(0xFFFFB7DE, {
        'highlight': Color(0xFFFFB7DE),
        'splash': Color(0xFFF94CBF),
      }),
    ),
    const CategoryProps(
      name: 'Mass',
      color: ColorSwatch(0xFF8899A8, {
        'highlight': Color(0xFF8899A8),
        'splash': Color(0xFFA9CAE8),
      }),
    ),
    const CategoryProps(
      name: 'Time',
      color: ColorSwatch(0xFFEAD37E, {
        'highlight': Color(0xFFEAD37E),
        'splash': Color(0xFFFFE070),
      }),
    ),
    const CategoryProps(
      name: 'Digital Storage',
      color: ColorSwatch(0xFF81A56F, {
        'highlight': Color(0xFF81A56F),
        'splash': Color(0xFF7CC159),
      }),
    ),
    const CategoryProps(
      name: 'Energy',
      color: ColorSwatch(0xFFD7C0E2, {
        'highlight': Color(0xFFD7C0E2),
        'splash': Color(0xFFCA90E5),
      }),
    ),
    const CategoryProps(
      name: 'Currency',
      color: ColorSwatch(0xFFCE9A9A, {
        'highlight': Color(0xFFCE9A9A),
        'splash': Color(0xFFF94D56),
        'error': Color(0xFF912D2D),
      }),
    ),
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
