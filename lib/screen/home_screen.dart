import 'package:flutter/material.dart';
import 'package:meal_app_2/provider/category_provider.dart';
import 'package:meal_app_2/screen/meal_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView(
        children:
            Provider.of<CategoryProvider>(context).DUMMY_CATEGORIES.map((c) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(MealScreen.routeName,
                  arguments: {'title': c.title, 'id': c.id});
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Card(
                elevation: 20,
                color: c.color,
                child: Center(
                  child: Text(
                    c.title,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 200,
        ));
  }
}
