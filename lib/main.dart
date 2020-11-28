import 'package:flutter/material.dart';
import 'package:meal_app_2/provider/category_provider.dart';
import 'package:meal_app_2/provider/meals_provider.dart';
import 'package:meal_app_2/screen/meal_item_screen.dart';
import 'package:meal_app_2/screen/meal_screen.dart';
import 'package:meal_app_2/widget/custome_bottom_nagivation.dart';
import 'package:meal_app_2/screen/favourite_screen.dart';
import 'package:meal_app_2/screen/filter.dart';
import 'package:meal_app_2/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => MealProvider(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (ctx) => CustomBottomNavigation(),
          FavouriteScreen.routeName: (ctx) => FavouriteScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          MealScreen.routeName: (ctx) => MealScreen(),
          MealItem.routeName: (ctx) => MealItem(),
          FilterScreen.routeName: (ctx) => FilterScreen(),
        },
      ),
    );
  }
}
