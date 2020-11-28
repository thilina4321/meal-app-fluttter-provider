import 'package:flutter/material.dart';
import 'package:meal_app_2/model/meal.dart';
import 'package:meal_app_2/provider/meals_provider.dart';
import 'package:meal_app_2/screen/meal_item_screen.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  static String routeName = 'favourite';
  final String image = 'assets/images/one.jpg';

  affordability(val) {
    if (val == Affordability.Affordable) {
      return 'Affordable';
    }
    if (val == Affordability.Luxurious) {
      return 'Luxury';
    }
    if (val == Affordability.Pricey) {
      return 'Pricey';
    }
  }

  complexity(val) {
    if (val == Complexity.Simple) {
      return 'Simple';
    }
    if (val == Complexity.Hard) {
      return 'Hard';
    }
    if (val == Complexity.Challenging) {
      return 'Challenging';
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<MealProvider>(context).favouriteMeals;

    return ListView.builder(
      itemBuilder: (ctx, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(MealItem.routeName, arguments: products[index].id);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(image, fit: BoxFit.cover),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(20),
                    child: Text(
                      products[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton.icon(
                        onPressed: () {},
                        label: Text(products[index].duration.toString()),
                        icon: Icon(Icons.lock_clock),
                      ),
                      FlatButton.icon(
                        onPressed: () {},
                        label: Text(
                          complexity(products[index].complexity),
                        ),
                        icon: Icon(Icons.merge_type),
                      ),
                      FlatButton.icon(
                        onPressed: () {},
                        label:
                            Text(affordability(products[index].affordability)),
                        icon: Icon(Icons.rice_bowl),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
