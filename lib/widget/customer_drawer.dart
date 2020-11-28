import 'package:flutter/material.dart';
import 'package:meal_app_2/screen/filter.dart';

class CustomerDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.blue,
              height: 120,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Meal App',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            DrawerItem(
              name: 'Meal',
              icon: Icons.no_meals,
              route: '/',
            ),
            DrawerItem(
              name: 'Filter',
              icon: Icons.settings,
              route: FilterScreen.routeName,
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final String route;

  DrawerItem({this.name, this.icon, this.route});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 5,
      child: FlatButton.icon(
        onPressed: () {
          Navigator.of(context).pushNamed(route);
        },
        padding: const EdgeInsets.all(10),
        icon: Icon(icon),
        label: Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
