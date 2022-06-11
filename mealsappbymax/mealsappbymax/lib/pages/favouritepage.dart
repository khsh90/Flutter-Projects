import 'package:flutter/cupertino.dart';

import '../modals/meal.dart';
import '../widgets/catergory_meal_item_widget.dart';

class FavouritePage extends StatelessWidget {
  List<Meal> favoriteMeal;

  FavouritePage(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text('Favourite Page'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) => CategoryMealItemWidget(
          id: favoriteMeal[index].id,
          title: favoriteMeal[index].title,
          imageURL: favoriteMeal[index].imageUrl,
          duration: favoriteMeal[index].duration,
          complexity: favoriteMeal[index].complexity,
          affordability: favoriteMeal[index].affordability,
          //  deleteMeal: _deleteMeal,
        ),
        itemCount: favoriteMeal.length,
      );
    }
  }
}
