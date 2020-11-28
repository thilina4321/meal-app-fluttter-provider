import 'package:flutter/material.dart';
import 'package:meal_app_2/provider/meals_provider.dart';
import 'package:provider/provider.dart';

class MealItem extends StatefulWidget {
  static String routeName = 'meal-item';

  @override
  _MealItemState createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    int isFav = Provider.of<MealProvider>(context)
        .favouriteMeals
        .indexWhere((m) => m.id == mealId);

    return Scaffold(
        appBar: AppBar(
          title: Text('Overview'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (isFav == -1) {
              Provider.of<MealProvider>(context, listen: false)
                  .addToFavourite(mealId);
            } else {
              Provider.of<MealProvider>(context, listen: false)
                  .removeFromFavourite(mealId);
            }
          },
          child:
              isFav == -1 ? Icon(Icons.favorite_outline) : Icon(Icons.favorite),
        ),
        body: Consumer<MealProvider>(
          builder: (ctx, meal, child) {
            return ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset(
                    'assets/images/one.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Steps',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                ...meal.DUMMY_MEALS
                    .firstWhere((m) => m.id == mealId)
                    .steps
                    .map((step) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(step),
                      ),
                    ),
                  );
                }).toList()
              ],
            );
          },
        ));
  }
}
