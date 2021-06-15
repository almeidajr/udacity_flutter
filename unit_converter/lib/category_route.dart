import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unit_converter/backdrop.dart';
import 'package:unit_converter/category.dart';
import 'package:unit_converter/category_tile.dart';
import 'package:unit_converter/unit.dart';
import 'package:unit_converter/unit_converter.dart';

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
  const CategoryRoute({Key? key}) : super(key: key);

  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  late Category _defaultCategory;
  Category? _currentCategory;
  late List<Category> _categories;
  // TODO: _categoryNames will be retrieved from the JSON asset
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

  // TODO: Remove the overriding of initState(). Instead, we use
  // didChangeDependencies()
  @override
  void initState() {
    super.initState();
    _categories = _categoryProps.map((CategoryProps categoryProp) {
      return Category(
        name: categoryProp.name,
        color: categoryProp.color,
        icon: Icons.cake,
        units: _retrieveUnitList(categoryProp.name),
      );
    }).toList();
    _defaultCategory = _categories.first;
  }

  // TODO: Uncomment this out. We use didChangeDependencies() so that we can
  // wait for our JSON asset to be loaded in (async).
  //  @override
  //  Future<void> didChangeDependencies() async {
  //    super.didChangeDependencies();
  //    // We have static unit conversions located in our
  //    // assets/data/regular_units.json
  //    if (_categories.isEmpty) {
  //      await _retrieveLocalCategories();
  //    }
  //  }

  /// Retrieves a list of [Categories] and their [Unit]s
  Future<void> _retrieveLocalCategories() async {
    // Consider omitting the types for local variables. For more details on Effective
    // Dart Usage, see https://www.dartlang.org/guides/language/effective-dart/usage
    final json = DefaultAssetBundle.of(context)
        .loadString('assets/data/regular_units.json');
    final data = JsonDecoder().convert(await json);
    if (data is! Map) {
      throw ('Data retrieved from API is not a Map');
    }
    // TODO: Create Categories and their list of Units, from the JSON asset
  }

  // TODO: Delete this function; instead, read in the units from the JSON asset
  // inside _retrieveLocalCategories()
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  /// Makes the correct number of rows for the list view, based on whether the
  /// device is portrait or landscape.
  ///
  /// For portrait, we use a [ListView]. For landscape, we use a [GridView].
  Widget _buildCategories(Orientation deviceOrientation) {
    if (deviceOrientation == Orientation.portrait) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return CategoryTile(
            category: _categories[index],
            onTap: _onCategoryTap,
          );
        },
        itemCount: _categories.length,
      );
    } else {
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3.0,
        children: _categories.map((Category c) {
          return CategoryTile(
            category: c,
            onTap: _onCategoryTap,
          );
        }).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_categories.isEmpty) {
      return Center(
        child: Container(
          height: 180.0,
          width: 180.0,
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Based on the device size, figure out how to best lay out the list
    // You can also use MediaQuery.of(context).size to calculate the orientation
    assert(debugCheckHasMediaQuery(context));
    final listView = Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 48.0,
      ),
      child: _buildCategories(MediaQuery.of(context).orientation),
    );

    return Backdrop(
      currentCategory: _currentCategory ?? _defaultCategory,
      frontPanel: _currentCategory == null
          ? UnitConverter(category: _defaultCategory)
          : UnitConverter(category: _currentCategory!),
      backPanel: listView,
      frontTitle: Text('Unit Converter'),
      backTitle: Text('Select a Category'),
    );
  }
}
