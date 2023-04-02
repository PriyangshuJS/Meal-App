import 'package:flutter/material.dart';

import 'catagory_page.dart';
import 'favorites.dart';
import '../widgets/drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      "page": const CatagoryPage(),
      "title": "Catagories",
    },
    {
      "page": Favorites(),
      "title": "Your Favorites",
    },
  ];

  int pageindex = 0;

  void _selectpage(int index) {
    setState(() {
      pageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[pageindex]["title"]),
      ),
      body: _pages[pageindex]["page"],
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectpage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).primaryColorLight.withBlue(10),
          unselectedFontSize: 15,
          selectedFontSize: 18,
          type: BottomNavigationBarType.shifting,
          currentIndex: pageindex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "Category",
                backgroundColor: Colors.pink),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
              backgroundColor: Colors.red,
            ),
          ]),
    );
  }
}
