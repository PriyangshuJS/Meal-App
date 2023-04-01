import 'package:flutter/material.dart';
import 'package:meal_app/screen/catagory_iteam_screen.dart';

class CatalogList extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CatalogList(this.id, this.title, this.color, {super.key});

  void selectCatagory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CatagoryItemScreen.routename, arguments: {
      "id": id,
      "title": title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCatagory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.2), color],
                begin: Alignment.topLeft,
                end: Alignment.topRight),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
