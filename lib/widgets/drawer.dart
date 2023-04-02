import 'package:flutter/material.dart';

import '../screen/meal_detail.dart';
import '../screen/filters_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Widget customList(IconData icon, String title, Function taphandler) {
    return ListTile(
      onTap: () => taphandler,
      leading: Icon(
        icon,
        size: 30,
        color: Colors.deepPurple,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: "RobotoCondensed",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Container(
          height: 150,
          width: double.infinity,
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          color: const Color.fromRGBO(103, 58, 183, 1),
          child: const Center(
            child: Text(
              "Profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: "RobotoCondensed-Bold",
              ),
            ),
          ),
        ),
        customList(
          Icons.restaurant,
          "Meal",
          () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MealDetail()));
          },
        ),
        customList(
          Icons.settings,
          "Filter",
          () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FiltersScreen()));
          },
        )
      ],
    ));
  }
}
