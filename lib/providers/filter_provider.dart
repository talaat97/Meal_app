// ignore_for_file: non_constant_identifier_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app2/providers/meals_provider.dart';

enum Filters {
  glutenfree,
  lactoseFree,
  vegan,
  vegetarian;
}

class FilterNotifer extends StateNotifier<Map<Filters, bool>> {
  FilterNotifer()
      : super({
          Filters.glutenfree: false,
          Filters.lactoseFree: false,
          Filters.vegetarian: false,
          Filters.vegan: false,
        });

  void setFilters(Map<Filters, bool> schodenFiltes) {
    state = schodenFiltes;
  }

  void setFilter(Filters filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filterProvider = StateNotifierProvider<FilterNotifer, Map<Filters, bool>>(
    (ref) => FilterNotifer());

final FilteredMealsProvier = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final cativeFilters = ref.watch(filterProvider);
  return meals.where((meal) {
    if (cativeFilters[Filters.glutenfree]! && !meal.isGlutenFree) {
      return false;
    }
    if (cativeFilters[Filters.lactoseFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (cativeFilters[Filters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (cativeFilters[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
