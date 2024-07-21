// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app2/models/meal.dart';
import 'package:meal_app2/providers/favorit.dart';
import 'package:meal_app2/providers/filter_provider.dart';
import 'package:meal_app2/providers/nav_par_provider.dart';
import 'package:meal_app2/screens/category_screen.dart';
import 'package:meal_app2/screens/filters_screen.dart';
import 'package:meal_app2/screens/meals_screen.dart';
import 'package:meal_app2/widgets/main_drawer.dart';

class TabScreen extends ConsumerWidget {
  TabScreen({super.key});

  final List<Meal> favoritMeal = [];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avaiableMeals = ref.watch(FilteredMealsProvier);
    final selectedPageIndex = ref.watch(navBarProvider);
    var namescreen = "category";
    selectedPageIndex == 0
        ? namescreen = "bic your category"
        : namescreen = "favorit";
    Widget activePAge = categoriesScreen(
      screenname: namescreen,
      avaiableMeals: avaiableMeals,
    );
    if (selectedPageIndex == 1) {
      final favoritMeal = ref.watch(favoritMealsProvider);
      activePAge = MealsScreen(
        meals: favoritMeal,
      );
    }

    return Scaffold(
      drawer: MainDrawer(
        onSelectScreen: (String identifier) {
          if (identifier == 'filters') {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => FilterScreen(),
              ),
            );
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
      appBar: AppBar(
        title: Text(namescreen),
      ),
      body: activePAge,
      bottomNavigationBar: BottomNavigationBar(
        onTap: ref.read(navBarProvider.notifier).selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "favorit"),
        ],
      ),
    );
  }
}
