import 'package:flutter/material.dart';
import 'package:foodApp/models/meals.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/argument.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMeals(this.availableMeals);

  Widget build(BuildContext context) {
    print('hello');
    final ScreenArguments routeArg = ModalRoute.of(context).settings.arguments;

    final mealId = routeArg.id;
    final mealTitle = routeArg.title;
    final categoriesMeals = availableMeals.where((meal) {
      return meal.categories.contains(mealId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            mealTitle,
            style: TextStyle(
                color: Color(0xFFFC8019), fontSize: 20, fontFamily: 'Kurale'),
          ),
        ),
        body: ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: categoriesMeals[index].id,
                title: categoriesMeals[index].title,
                imageUrl: categoriesMeals[index].imageUrl,
                duration: categoriesMeals[index].duration,
                complexity: categoriesMeals[index].complexity,
                affordability: categoriesMeals[index].affordability,
              );
            },
            itemCount: categoriesMeals.length));
  }
}
