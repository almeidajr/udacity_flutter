// You can read about packages here: https://flutter.io/using-packages/
import 'package:flutter/material.dart';
// You can use a relative import, i.e. `import 'category.dart';` or
// a package import, as shown below.
// More details at http://dart-lang.github.io/linter/lints/avoid_relative_lib_imports.html
import 'package:unit_converter/category.dart';

// TODO: Pass this information into your custom [Category] widget
/// The function that is called when main.dart is run.
void main() {
  runApp(UnitConverterApp());
}

const _categoryColor = Colors.green;
const _categoryIcon = Icons.cake;

const _categoryName = 'Cake';

/// This widget is the root of our application.
/// Currently, we just show one widget in our app.
class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: Scaffold(
        backgroundColor: Colors.green[100],
        body: Center(
          // TODO: Determine what properties you'll need to pass into the widget
          child: Category(
            name: _categoryName,
            color: _categoryColor,
            icon: _categoryIcon,
          ),
        ),
      ),
    );
  }
}
