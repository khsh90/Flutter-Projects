// import 'package:flutter/material.dart';

// class FilterWidget extends StatefulWidget {
//   final Function filterSwitch;
//   Map<String, bool> filter;

//   FilterWidget(this.filterSwitch, this.filter);

//   @override
//   State<FilterWidget> createState() => _FilterWidgetState();
// }

// class _FilterWidgetState extends State<FilterWidget> {
//   bool isGlutten = false;
//   bool isVegetrian = false;
//   bool isVegan = false;
//   bool isLactosFree = false;

//   Widget switchDesign(
//       {required String mainTitle,
//       required String subtitle,
//       required bool mealValue,
//       required IconData mealIcon,
//       required Function(bool) switchFunction}) {
//     return Column(
//       children: [
//         ListTile(
//           leading: Icon(
//             mealIcon,
//             size: 29,
//           ),
//           title: Text(
//             mainTitle,
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           subtitle: Text(
//             subtitle,
//             style: const TextStyle(fontSize: 15),
//           ),
//           trailing: Switch(value: mealValue, onChanged: switchFunction),
//         ),
//         const SizedBox(
//           height: 15,
//         )
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     Map<String, bool> filterData = {
//       'glutten': isGlutten,
//       'vegetrian': isVegetrian,
//       'vegan': isVegan,
//       'lactos': isLactosFree
//     };

//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 30),
//       alignment: Alignment.center,
//       child: Column(
//         children: [
//           const Text(
//             'Filter your meals',
//             style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           switchDesign(
//               mainTitle: 'Glutten Free',
//               subtitle: 'This for glutten meals',
//               mealValue: isGlutten,
//               mealIcon: Icons.restaurant,
//               switchFunction: (value) => setState(() {
//                     isGlutten = value;

//                     print('the status is :${widget.filter['glutten']}');
//                   })),
//           switchDesign(
//               mainTitle: 'Vegetarian',
//               subtitle: 'This for vegetrian meals',
//               mealValue: isVegetrian,
//               mealIcon: Icons.local_restaurant_sharp,
//               switchFunction: (value) => setState(() {
//                     isVegetrian = value;
//                   })),
//           switchDesign(
//               mainTitle: 'Vegan',
//               subtitle: 'This for vegan meals',
//               mealValue: isVegan,
//               mealIcon: Icons.table_restaurant_sharp,
//               switchFunction: (value) => setState(() {
//                     isVegan = value;
//                   })),
//           switchDesign(
//               mainTitle: 'Lactos Free',
//               subtitle: 'This for lactos meals',
//               mealValue: isLactosFree,
//               mealIcon: Icons.spoke_rounded,
//               switchFunction: (value) => setState(() {
//                     isLactosFree = value;
//                   })),
//         ],
//       ),
//     );
//   }
// }
