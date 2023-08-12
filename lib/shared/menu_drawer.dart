import 'package:flutter/material.dart';
import 'package:globo_fitness/screens/weather_screen.dart';
import '../screens/intro_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final Map<String, Widget> menuRoutes = {
      'Home': const IntroScreen(),
      'Weather': WeatherScreen(
          key: UniqueKey()), // Pass a unique key to the WeatherScreen widget.
    };

    final List<String> menuTitles = [
      'Home',
      'BMI Calculator',
      'Weather',
      'Training',
    ];

    List<Widget> menuItems = [];

    menuItems.add(
      const SizedBox(
        height: 100,
        child: DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
          ),
          child: Text(
            'Globo Fitness',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ),
      ),
    );

    menuItems.addAll(menuTitles.map((element) {
      return ListTile(
        title: Text(
          element,
          style: const TextStyle(fontSize: 18),
        ),
        onTap: () {
          if (menuRoutes.containsKey(element)) {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => menuRoutes[element]!,
              ),
            );
          }
        },
      );
    }));

    return menuItems;
  }
}
