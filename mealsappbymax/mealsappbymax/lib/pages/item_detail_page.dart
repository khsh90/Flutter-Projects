import 'package:flutter/material.dart';
import '../dummydata.dart';

class ItemDetailScreen extends StatelessWidget {
  static String routerName = '/itemDetailScreen';

  final Function ToggleFavoriteMeal;
  final Function isFavorite;

  ItemDetailScreen(this.ToggleFavoriteMeal, this.isFavorite);

  //  ItemDetailScreen({Key? key}) : super(key: key);

  Widget titleHeader({required BuildContext ctx, required String textInput}) {
    return Container(
      margin: const EdgeInsets.only(top: 22, bottom: 1),
      child: Text(
        textInput,
        style: Theme.of(ctx).textTheme.titleMedium,
      ),
    );
  }

  Widget containerDesign(Widget child) {
    return Container(
        margin: const EdgeInsets.all(22),
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(15)),
        height: 150,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)?.settings.arguments as String;
    final filteredMealDetail =
        mealData.firstWhere((eachMealData) => eachMealData.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          filteredMealDetail.title,
          softWrap: true,
          overflow: TextOverflow.fade,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child:
                  Image.network(filteredMealDetail.imageUrl, fit: BoxFit.cover),
            ),
            titleHeader(ctx: context, textInput: 'Ingreadiants'),
            containerDesign(
              ListView.builder(
                  itemBuilder: (context, index) => Card(
                        color: Colors.amber,
                        child: Text(
                          '  ${filteredMealDetail.ingredients[index]}',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                  itemCount: filteredMealDetail.ingredients.length),
            ),
            titleHeader(ctx: context, textInput: 'Steps'),
            containerDesign(ListView.builder(
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text(
                    '# ${index + 1}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  '${filteredMealDetail.steps[index]}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              itemCount: filteredMealDetail.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            isFavorite(mealId) ? Icons.star : Icons.star_border,
            color: Colors.black,
          ),
          onPressed: () => ToggleFavoriteMeal(mealId)),
    );
  }
}
