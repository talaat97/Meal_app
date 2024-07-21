import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app2/models/meal.dart';

class FavoritMealsNotifer extends StateNotifier<List<Meal>> {
  FavoritMealsNotifer() : super([]);

  bool toggleMleaFavoritStatus(Meal meal) {
    final isExisting = state.contains(meal);

    if (isExisting) {
      //remove
      state = state.where((element) => element.id != meal.id).toList();
      return false ;
    }
    else {
      //add
      state = [...state, meal];
      //_showInfoMessage('You add meal to favorit ');
    return true ;
    }

  }
}

final favoritMealsProvider =
    StateNotifierProvider<FavoritMealsNotifer, List<Meal>>((ref) {
  return FavoritMealsNotifer();
});
