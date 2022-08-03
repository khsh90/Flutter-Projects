import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mealsbykhaled/pages/botttomNavigationPage.dart';
import 'package:mealsbykhaled/pages/filterpage.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 250,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          Container(
            height: 110,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Cooking!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 10,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(BottomNavigationBarPage.routeNeme),
            leading: const Icon(
              Icons.restaurant,
              size: 30,
            ),
            title: const Text(
              'Meals',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed(FilterPage.routeName),
            leading: const Icon(
              Icons.settings,
              size: 30,
            ),
            title: const Text(
              'Filter',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
