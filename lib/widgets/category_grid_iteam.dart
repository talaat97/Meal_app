import 'package:flutter/material.dart';
import 'package:meal_app2/models/category.dart';
import 'package:meal_app2/models/meal.dart';
import 'package:meal_app2/screens/meals_screen.dart';

class CategoryGridIteam extends StatelessWidget {
  const CategoryGridIteam({
    super.key,
    required this.category,
   
    required this.avaiableMeals,
  });

  final Category category;

  final List<Meal> avaiableMeals;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final filterdMeal = avaiableMeals
            .where(
              (meal) => meal.categories.contains(category.id),
            )
            .toList();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MealsScreen(
            title: category.title,
            meals: filterdMeal,
          
          ),
        ));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.54),
                category.color.withOpacity(0.9)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )),
    );
  }
}
