import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: NavigationRail(destinations: [
      NavigationRailDestination(
          icon: Icon(Icons.auto_awesome), label: Text('Featured'))
    ], selectedIndex: 0));
  }
}
