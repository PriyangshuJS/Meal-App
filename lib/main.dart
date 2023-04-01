import 'package:flutter/material.dart';
import 'package:meal_app/screen/tabs_screen.dart';

import 'screen/catagory_iteam_screen.dart';
import 'screen/catagory_page.dart';
import '../screen/meal_detail.dart';

void main() {
  runApp(const MealApp());
}

class MealApp extends StatelessWidget {
  const MealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(225, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              // bodyText1: TextStyle(
              //   color: Colors.black54,
              // )

              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: const TabsScreen(),
      //initialRoute: "/",
      routes: {
        //"/": (ctx) => const CatagoryPage(), // this is home

        CatagoryItemScreen.routename: (ctx) => CatagoryItemScreen(),
        //"/catagory-meal": (ctx) => CatagoryItemScreen(),
        MealDetail.routename: (ctx) => MealDetail(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal App"),
      ),
    );
  }
}
