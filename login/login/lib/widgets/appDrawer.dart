import 'package:flutter/material.dart';
import 'package:login/pages/userdetailspage.dart';
import 'package:login/pages/userjobsoverviewpage.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                color: Colors.black45,
                child: Card(
                  color: Colors.amber,
                  elevation: 3,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    child: const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Text(
                        'Hello, Admin',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Courgette',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(UserjobsoverviewPage.route);
            },
            leading: const Icon(Icons.work),
            title: const Text('User jobs overview '),
          ),
        ],
      ),
    );
  }
}
