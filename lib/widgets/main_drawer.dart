import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListItem(String text, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoC',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            child: Text(
              "Cooking meals!",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          buildListItem(
            "Meals",
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListItem(
            "Filters",
            Icons.settings,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
