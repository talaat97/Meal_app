// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:meal_app2/date/dummy_data.dart';
import 'package:meal_app2/widgets/category_grid_iteam.dart';

import '../models/meal.dart';

// ignore: camel_case_types
class categoriesScreen extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String screenname;
  const categoriesScreen(
      {super.key, required this.screenname, required this.avaiableMeals});
  final List<Meal> avaiableMeals;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in avaliableCategories)
          CategoryGridIteam(category: category, avaiableMeals: avaiableMeals)
      ],
    );
  }
}
