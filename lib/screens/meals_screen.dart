// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meal_app2/models/meal.dart';
import 'package:meal_app2/screens/meal_detail_screen.dart';

import '../widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals, 
  });
  final String? title;
  final List<Meal> meals;
 

  @override
  Widget build(BuildContext context) {
    return title == null
        ? contant(context)
        : Scaffold(
            appBar: AppBar(title: Text(title!)),
            body: contant(context),
          );
  }

  SingleChildScrollView contant(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: meals
            .map((meal) => MealItem(
                  meal: meal,
                  OnSelectMeal: (Meal meal) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => MealDetailScreen(
                        meal: meal,
                      
                      ),
                    ));
                  },
                ))
            .toList(),
      ),
    );
  }
}
