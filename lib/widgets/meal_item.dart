import 'package:flutter/material.dart';

import '../screen/meal_detail.dart';
import '../model/meals.dart';

class MealItems extends StatelessWidget {
  final String mealId;
  final String mealTitle;
  final String mealImg;
  final int mealDuration;
  final Complexity mealCompl;
  final Affordability mealAff;
  const MealItems({
    super.key,
    required this.mealId,
    required this.mealTitle,
    required this.mealImg,
    required this.mealDuration,
    required this.mealCompl,
    required this.mealAff,
  });

  String get complexityText {
    switch (mealCompl) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Hard:
        return "Hard";
      case Complexity.Challenging:
        return "Challenging";
      default:
        return "Unknown !";
    }
  }

  String get affordabilityTest {
    switch (mealAff) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return "Luxurious";
      default:
        return "Unknown !";
    }
  }

  void mealdetail(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetail.routename, arguments: mealId);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => mealdetail(context),
        child: Card(
          margin: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 10,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      mealImg,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        mealTitle,
                        style: const TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.schedule),
                    Text("$mealDuration"),
                    const SizedBox(width: 6),
                    const Icon(Icons.work),
                    Text(complexityText),
                    const SizedBox(width: 6),
                    const Icon(Icons.attach_money),
                    Text(affordabilityTest)
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
