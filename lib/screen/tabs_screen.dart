import 'package:flutter/material.dart';

import 'catagory_page.dart';
import 'favorites.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0, // denotes which tab will be shown first
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Meals"),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Category",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "Favorite",
              ),
            ]),
          ),
          body: TabBarView(children: [const CatagoryPage(), Favorites()]),
        ));
  }
}
