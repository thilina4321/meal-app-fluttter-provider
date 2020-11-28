import 'package:flutter/material.dart';
import 'package:meal_app_2/provider/meals_provider.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = '/filter';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List types = ['Lactose Free', 'Vegetarian', 'Vegan', 'Gluten Free'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Consumer<MealProvider>(
            builder: (ctx, filter, child) {
              return ListView(
                children: [
                  Text(
                    'Adjust your meal selection',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ...List.generate(4, (index) {
                    return Row(
                      children: [
                        Text(
                          types[index],
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Switch(
                            value: index == 0
                                ? filter.isLactoseFree
                                : index == 1
                                    ? filter.isVegetarian
                                    : index == 2
                                        ? filter.isVegan
                                        : filter.isGlutenFree,
                            onChanged: (val) {
                              index == 0
                                  ? filter.onLactoseFree(val)
                                  : index == 1
                                      ? filter.onVegetarian(val)
                                      : index == 2
                                          ? filter.onVegan(val)
                                          : filter.onGlutenFree(val);
                            })
                      ],
                    );
                  }).toList()
                ],
              );
            },
          )),
    );
  }
}
