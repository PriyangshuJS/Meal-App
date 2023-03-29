import 'package:flutter/material.dart';

class CatagoryItemScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final title;
  const CatagoryItemScreen(this.title, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text(
          "Recipe",
        ),
      ),
    );
  }
}
