import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _NavigationRail();
  }
}

class _NavigationRail extends StatefulWidget {
  const _NavigationRail({
    Key? key,
  }) : super(key: key);

  @override
  State<_NavigationRail> createState() => _NavigationRailState();
}

class _NavigationRailState extends State<_NavigationRail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: NavigationRail(
                    labelType: NavigationRailLabelType.all,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.auto_awesome_outlined),
                        selectedIcon: Icon(Icons.auto_awesome),
                        label: Text('Featured'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.phone_android),
                        label: Text('phones'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.tv),
                        label: Text('Featured'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.auto_awesome),
                        label: Text('Featured'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.auto_awesome_outlined),
                        selectedIcon: Icon(Icons.auto_awesome),
                        label: Text('Featured'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.phone_android),
                        label: Text('phones'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.tv),
                        label: Text('Featured'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.auto_awesome),
                        label: Text('Featured'),
                      ),
                    ],
                    selectedIndex: 0,
                  ),
                ),
              ),
            );
          }),
          VerticalDivider(thickness: 1, width: 1)
        ],
      ),
    );
  }
}
