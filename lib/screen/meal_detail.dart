import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routename = "/mealDetail";
  Widget titleTxt(BuildContext context, String txt) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        txt,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget customContainer(Widget child) {
    return Container(
      height: 190,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(5),
      child: child,
    );
  }

  const MealDetail({super.key});
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    final selectedMeal =
        dummyMeal.firstWhereOrNull((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal?.title ?? "Not found"), // Default operatior
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 200,
            width: double.infinity,
            child: Image.network(
              selectedMeal!.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          titleTxt(context, "Ingreadients "),
          customContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => Card(
                elevation: 5,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    selectedMeal.ingredients[index],
                  ),
                ),
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          titleTxt(context, "Steps"),
          customContainer(
            ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: Text("${index + 1}"),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  const Divider()
                ],
              ),
              itemCount: selectedMeal.steps.length,
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ]),
      ),
    );
  }
}
