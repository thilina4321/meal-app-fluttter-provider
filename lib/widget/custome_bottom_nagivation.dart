import 'package:flutter/material.dart';
import 'package:meal_app_2/widget/customer_drawer.dart';
import 'package:meal_app_2/screen/favourite_screen.dart';
import 'package:meal_app_2/screen/home_screen.dart';

class CustomBottomNavigation extends StatefulWidget {
  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;
  void changePages(index) {
    setState(() {
      print(pages[_selectedIndex]);
      _selectedIndex = index;
    });
  }

  List pages = [HomeScreen(), FavouriteScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomerDrawer(),
      appBar: AppBar(
        title: Text("Meal"),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.favorite),
          ),
        ],
        elevation: 10,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        onTap: changePages,
      ),
    );
  }
}
