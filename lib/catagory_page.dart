import 'package:flutter/material.dart';

import './catalog_item.dart';
import './dummy_data.dart';

class CatagoryPage extends StatelessWidget {
  const CatagoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog "),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: Dummy_Catagory.map(
          (catdata) => CatalogList(
            catdata.id,
            catdata.title,
            catdata.color,
          ),
        ).toList(),
      ),
    );
  }
}
