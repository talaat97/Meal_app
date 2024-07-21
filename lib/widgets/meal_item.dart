// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meal_app2/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    // ignore: non_constant_identifier_names
    required this.OnSelectMeal,
  });

  final Meal meal;
  // ignore: non_constant_identifier_names
  final void Function(Meal meal) OnSelectMeal;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: Column(
        children: [
          InkWell(
            onTap: () => OnSelectMeal(meal),
            child: Stack(
              children: [
                Hero(
                  tag: meal.id,
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(meal.imageUrl),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 44),
                    color: Colors.black45,
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          meal.title,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 236, 230, 230),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.schedule),
                                    SizedBox(width: 6),
                                    Text(
                                      '${meal.duration} min',
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 236, 230, 230),
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                                 // SizedBox(width: 20),
                                Row(
                                  children: [
                                    Icon(Icons.work),
                                    SizedBox(width: 6),
                                    Text(
                                      meal.complexity.name,
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 236, 230, 230),
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                                // SizedBox(width: 20),
                                Row(
                                  children: [
                                    Icon(Icons.abc_sharp),
                                    SizedBox(width: 6),
                                    Text(
                                      meal.affordability.name,
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 236, 230, 230),
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
