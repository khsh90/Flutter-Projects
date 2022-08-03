import 'package:flutter/material.dart';
import 'package:mealsbykhaled/pages/categorypage.dart';
import 'package:mealsbykhaled/pages/favoritepage.dart';

import '../widgets/drawerwidget.dart';

class BottomNavigationBarPage extends StatefulWidget {
  static String routeNeme = '/';
  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  List<Map<String, dynamic>>? navogationWidget;

  var pageIndex = 0;

  void selectedIndex(int index) => setState(() {
        pageIndex = index;
      });

  @override
  void initState() {
    navogationWidget = [
      {'page': CategoryPage(), 'title': 'Category Screen'},
      {'page': FavoritePage(), 'title': 'Favorite Screen'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${navogationWidget?[pageIndex]['title']}')),
      body: navogationWidget?[pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.category,
              ),
              label: 'Category',
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.star,
              ),
              label: 'Favorite',
              backgroundColor: Theme.of(context).primaryColor),
        ],
        currentIndex: pageIndex,
        onTap: selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white60,
        type: BottomNavigationBarType.shifting,
      ),
      drawer: DrawerWidget(),
    );
  }
}
