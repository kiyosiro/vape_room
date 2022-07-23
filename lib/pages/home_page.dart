import 'package:flutter/material.dart';
import 'package:vape_room/pages/mix_page.dart';
import 'Recipe_Book_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.appName}) : super(key: key);
  final String appName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAlreadyMix = true;
  int _selectedIndex = 0;

  List<Widget> pages = <Widget>[
    MixPage(),
    const RecipeBookPage(),
    const RecipeBookPage(),
  ];

  void _onNaviItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNaviItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.vaccines),
            label: 'Mix',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            label: 'Myレシピ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Items',
          )
        ],
      ),
    );
  }
}
