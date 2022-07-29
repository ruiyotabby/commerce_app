
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _NavigationRail();
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
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: SizedBox(
          height: 40,
          // padding: EdgeInsets.all(8),
          child: TextField(
            enabled: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              labelText: 'Search...',
            ),
            onTap: () {},
          ),
        ),
      ),
      body: Row(
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: NavigationRail(
                    useIndicator: true,
                    indicatorColor: Colors.grey[200],
                    labelType: NavigationRailLabelType.all,
                    destinations: const [
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
                        label: Text('phones'),
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
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
            );
          }),
          const VerticalDivider(thickness: 1, width: 1),
          //make listview below. replace expanded
          const Expanded(
            child: NavigationRailPages(),
          ),
        ],
      ),
    );
  }
}

class NavigationRailPages extends StatelessWidget {
  const NavigationRailPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: [
        //make Card the widget parent
        Card(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 38,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Accessories'),
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'ALL',
                                style: TextStyle(color: Colors.orange[900]),
                              ),
                              Icon(
                                Icons.navigate_next_outlined,
                                color: Colors.orange[900],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(thickness: 1),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 3,
                  children: [
                    gridViewColumn('', 'Category grid'),
                    gridViewColumn(' ', 'Grid')
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column gridViewColumn(String image, String label) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          label,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
