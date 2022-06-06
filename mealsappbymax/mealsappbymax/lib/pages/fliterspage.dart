import 'package:flutter/material.dart';
import 'package:mealsappbymax/widgets/drawer.dart';

// class FiltersPage extends StatefulWidget {
//   @override
//   State<FiltersPage> createState() => _FiltersPageState();
// }

class FiltersPage extends StatefulWidget {
  static String routeName = '/FiltersPage';

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactosFree = false;
  @override
  Widget build(BuildContext context) {
    Widget _buildSwitchListTile({
      required String title,
      required String description,
      required bool filteredValue,
      required Function(bool) functionValue,
      required Widget icon,
    }) {
      return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: filteredValue,
        activeColor: Colors.red,
        onChanged: functionValue,
        secondary: icon,
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Filter Screen'),
          backgroundColor: Colors.red,
        ),
        drawer: AppDrawer(headerDrawerColor: Colors.red),
        body: Column(children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Filter your meals',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  title: 'Glutten Free',
                  description: 'This for glutten meals',
                  filteredValue: _glutenFree,
                  functionValue: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  icon: const Icon(Icons.restaurant)),
              _buildSwitchListTile(
                  title: 'vegetarian',
                  description: 'This for vegetarian meals',
                  filteredValue: _vegetarian,
                  functionValue: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                  icon: const Icon(Icons.restaurant_menu)),
              _buildSwitchListTile(
                  title: 'vegan',
                  description: 'This for vegan meals',
                  filteredValue: _vegan,
                  functionValue: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                  icon: const Icon(Icons.no_food)),
              _buildSwitchListTile(
                  title: 'lactos Free',
                  description: 'This for lactos meal',
                  filteredValue: _lactosFree,
                  functionValue: (newValue) {
                    setState(() {
                      _lactosFree = newValue;
                    });
                  },
                  icon: const Icon(Icons.food_bank)),
            ],
          ))
        ]));
  }
}
