import 'package:flutter/material.dart';
import 'package:meal_app_2/model/meal.dart';
import 'package:meal_app_2/provider/meals_provider.dart';
import 'package:meal_app_2/screen/meal_item_screen.dart';
import 'package:provider/provider.dart';

class MealScreen extends StatefulWidget {
  static String routeName = '/meal';

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
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
    final data = ModalRoute.of(context).settings.arguments as Map;

    // var products;
    var products = Provider.of<MealProvider>(context).DUMMY_MEALS;

    if (Provider.of<MealProvider>(context).isGlutenFree) {
      print('Gluteen');
      setState(() {
        products = products.where((meal) {
          return meal.isGlutenFree;
        }).toList();
      });
    }
    if (Provider.of<MealProvider>(context).isLactoseFree) {
      setState(() {
        products = products.where((meal) {
          return meal.isLactoseFree;
        }).toList();
      });
    }
    if (Provider.of<MealProvider>(context).isVegan) {
      setState(() {
        products = products.where((meal) {
          return meal.isVegan;
        }).toList();
      });
    }
    if (Provider.of<MealProvider>(context).isVegetarian) {
      setState(() {
        products = products.where((meal) {
          return meal.isVegetarian;
        }).toList();
      });
    }

    products = products.where((meal) {
      return meal.categories.contains(data['id']);
    }).toList();

    products.forEach((element) {
      print(element.title);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(data['title']),
      ),
      body: Consumer<MealProvider>(
        builder: (ctx, filter, child) {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(MealItem.routeName,
                      arguments: products[index].id);
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
                              label: Text(
                                  affordability(products[index].affordability)),
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
        },
      ),
    );
  }
}
