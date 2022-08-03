import 'package:flutter/material.dart';
import 'package:mealsbykhaled/widgets/filterwidget.dart';

// class FilterPage extends StatelessWidget {
//   final Function filterSwitch;
//   final Map<String, bool> filter;

//   FilterPage(this.filterSwitch, this.filter);
//   static String routeName = '/filterPage';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Filter Screen'),
//         actions: [
//           IconButton(
//               onPressed: (() => filterSwitch(filter)),
//               icon: const Icon(Icons.save))
//         ],
//       ),
//       body: FilterWidget(
//         filterSwitch,
//         filter,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  static String routeName = '/filterPage';

  final Function filterSwitch;
  Map<String, bool> filter;

  FilterPage(this.filterSwitch, this.filter);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  void initState() {
    isGlutten = widget.filter['glutten']!;
    isVegetrian = widget.filter['vegetrian']!;
    isVegan = widget.filter['vegan']!;
    isLactosFree = widget.filter['lactos']!;

    super.initState();
  }

  bool isGlutten = false;
  bool isVegetrian = false;
  bool isVegan = false;
  bool isLactosFree = false;

  Widget switchDesign(
      {required String mainTitle,
      required String subtitle,
      required bool mealValue,
      required IconData mealIcon,
      required Function(bool) switchFunction}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            mealIcon,
            size: 29,
          ),
          title: Text(
            mainTitle,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 15),
          ),
          trailing: Switch(value: mealValue, onChanged: switchFunction),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Page'),
        actions: [
          IconButton(
              onPressed: () {
                Map<String, bool> filterData = {
                  'glutten': isGlutten,
                  'vegetrian': isVegetrian,
                  'vegan': isVegan,
                  'lactos': isLactosFree
                };
                widget.filterSwitch(filterData);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text(
              'Filter your meals',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            switchDesign(
                mainTitle: 'Glutten Free',
                subtitle: 'This for glutten meals',
                mealValue: isGlutten,
                mealIcon: Icons.restaurant,
                switchFunction: (value) => setState(() {
                      isGlutten = value;

                      print('first the status is :${widget.filter['glutten']}');
                      print(' the glutten is :$isGlutten');
                    })),
            switchDesign(
                mainTitle: 'Vegetarian',
                subtitle: 'This for vegetrian meals',
                mealValue: isVegetrian,
                mealIcon: Icons.local_restaurant_sharp,
                switchFunction: (value) => setState(() {
                      isVegetrian = value;
                      print('the status is :${widget.filter['vegetrian']}');
                    })),
            switchDesign(
                mainTitle: 'Vegan',
                subtitle: 'This for vegan meals',
                mealValue: isVegan,
                mealIcon: Icons.table_restaurant_sharp,
                switchFunction: (value) => setState(() {
                      isVegan = value;
                      print('the status is :${widget.filter['vegan']}');
                    })),
            switchDesign(
                mainTitle: 'Lactos Free',
                subtitle: 'This for lactos meals',
                mealValue: isLactosFree,
                mealIcon: Icons.spoke_rounded,
                switchFunction: (value) => setState(() {
                      isLactosFree = value;
                      print('the status is :${widget.filter['lactos']}');
                    })),
          ],
        ),
      ),
    );
  }
}
