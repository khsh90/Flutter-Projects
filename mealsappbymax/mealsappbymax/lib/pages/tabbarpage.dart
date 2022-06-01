import 'package:flutter/material.dart';
import '../pages/category_meal_item._page.dart';
import '../pages/catergory_page.dart';
import './favouritepage.dart';

//this one for top bar.
class TabBarViewPage extends StatefulWidget {
  @override
  State<TabBarViewPage> createState() => _TabBarViewState();
}

class _TabBarViewState extends State<TabBarViewPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // initialIndex: 0, default is 0
      //the length detarmain how many tabs
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Meals'),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
                child: Text('Categories'),
              ),
              Tab(
                icon: Icon(Icons.star),
                child: Text('Favourites'),
              )
            ]),
          ),
          // in tabba bar the lenght is corosponding to each page first tab for CategoryScreen and so on
          body: TabBarView(children: [CategoryScreen(), FavouritePage()])),
    );
  }
}
