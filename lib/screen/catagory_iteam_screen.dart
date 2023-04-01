import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CatagoryItemScreen extends StatelessWidget {
  static const routename = "/catagory-meal";
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final cattitle = routeArgument["title"].toString();
    final catid = routeArgument["id"];

    final catagoryMeal = dummyMeal.where((meal) {
      return meal.categories.contains(catid);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(cattitle),
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItems(
              mealId: catagoryMeal[index].id,
              mealTitle: catagoryMeal[index].title,
              mealImg: catagoryMeal[index].imageUrl,
              mealDuration: catagoryMeal[index].duration,
              mealCompl: catagoryMeal[index].complexity,
              mealAff: catagoryMeal[index].affordability);
        },
        itemCount: catagoryMeal.length,
      )),
    );
  }
}
