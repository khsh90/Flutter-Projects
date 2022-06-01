import 'package:flutter/material.dart';
import '../pages/fliterspage.dart';

class AppDrawer extends StatelessWidget {
  final Color headerDrawerColor;
  Widget drawerMealItem(
      {required IconData icon,
      required String itemName,
      required VoidCallback functionHandler}) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListTile(
        leading: Icon(
          icon,
          size: 35,
        ),
        title: Text(
          itemName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        onTap: functionHandler,
      ),
    );
  }

  AppDrawer({required this.headerDrawerColor});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: const Border(
                  bottom: BorderSide(width: 2, color: Colors.grey),
                ),
                color: headerDrawerColor),
            height: 120,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            //  color: headerDrawerColor,
            child: const Text(
              'Cooking!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          drawerMealItem(
              icon: Icons.restaurant,
              itemName: 'Meals',
              functionHandler: () {
                Navigator.of(context).pushNamed('/');
              }),
          drawerMealItem(
              icon: Icons.settings,
              itemName: 'Filter',
              functionHandler: () {
                Navigator.of(context).pushNamed(FiltersPage.routeName);
              }),
        ],
      ),
    );
  }
}
