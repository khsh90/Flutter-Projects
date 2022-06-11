import 'package:flutter/material.dart';
import 'package:mealsappbymax/modals/meal.dart';
import '../widgets/drawer.dart';
import '../pages/category_meal_item._page.dart';
import '../pages/catergory_page.dart';
import './favouritepage.dart';

class BottomBarViewPage extends StatefulWidget {
  List<Meal> favoriteMeal;

  BottomBarViewPage(this.favoriteMeal);
  @override
  State<BottomBarViewPage> createState() => _BottomBarViewPageState();
}

//this one for bottom bar

class _BottomBarViewPageState extends State<BottomBarViewPage> {
  var pageIndex = 0;
  void _selectedPage(int value) {
    setState(() {
      pageIndex = value;
    });
  }

  final color1 = Colors.purple;
  final color2 = Colors.green;

  List<Map<String, dynamic>>? pageItems;

  List<Color> appBarColor = [
    Colors.purple,
    Colors.green,
  ];

  @override
  void initState() {
    pageItems = [
      {
        'page': CategoryScreen(),
        'title': 'Category Screen',
        'color': Colors.purple,
      },
      {
        'page': FavouritePage(widget.favoriteMeal),
        'title': 'Your favourites',
        'color': Colors.green
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(headerDrawerColor: appBarColor[pageIndex]),
      appBar: AppBar(
        title: Text(pageItems?[pageIndex]['title']),
        backgroundColor: appBarColor[pageIndex],
      ),
      // in tabba bar the lenght is corosponding to each page first tab for CategoryScreen and so on
      body: pageItems?[pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        currentIndex: pageIndex,
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              backgroundColor: appBarColor[pageIndex],
              icon: const Icon(Icons.category),
              label: 'Catrgories'),
          BottomNavigationBarItem(
            backgroundColor: appBarColor[pageIndex],
            icon: const Icon(Icons.star),
            label: 'Favourite',
          )
        ],
      ),
    );
  }
}
