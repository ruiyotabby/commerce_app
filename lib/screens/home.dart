import 'package:commerce_app/screens/account.dart';
import 'package:commerce_app/screens/cart.dart';
import 'package:commerce_app/screens/category.dart';
import 'package:commerce_app/screens/message.dart';
import 'package:commerce_app/services/get_data.dart';
import 'package:commerce_app/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final screens = [
    HomeTabs(),
    const CategoryPage(),
    const MessagePage(),
    const CartPage(),
    const AccountPage(),
  ];

  final Color? unselectedColor = Colors.grey[700];
  final Color? selectedColor = Colors.black;

  Widget navBarColumn(
      int index, IconData selected, IconData unselected, String label) {
    // index is the page number
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            setState(() {
              pageIndex = index;
            });
          },
          icon: pageIndex == index
              ? Icon(
                  selected,
                  size: 40,
                  color: selectedColor,
                )
              : Icon(
                  unselected,
                  size: 40,
                  color: unselectedColor,
                ),
        ),
        Text(label) //text displayed under the icons
      ],
    );
  }

  Widget buildNavBar(BuildContext context) {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ? const Icon(
                          Icons.home_outlined,
                          color: Colors.red,
                          size: 40,
                        )
                      : Icon(
                          Icons.home_outlined,
                          size: 40,
                          color: unselectedColor,
                        )),
              const Text('Home')
            ],
          ),
          navBarColumn(
              1, Icons.category_sharp, Icons.category_outlined, 'Categories'),
          navBarColumn(2, Icons.chat_bubble_outlined, Icons.chat_bubble_outline,
              'Messages'),
          navBarColumn(
              3, Icons.shopping_cart, Icons.shopping_cart_outlined, 'Cart'),
          navBarColumn(
              4, Icons.account_circle, Icons.account_circle_outlined, 'Account')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[pageIndex],
      bottomNavigationBar: buildNavBar(context),
    );
  }
}

class HomeTabs extends StatelessWidget {
  HomeTabs({Key? key}) : super(key: key);

  Card offerCard(String image, String label, String trailing) {
    return Card(
      margin: const EdgeInsets.all(1),
      child: Column(
        children: [
          // Image.asset(image),
          Container(
            color: const Color.fromARGB(255, 238, 201, 34),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      trailing,
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  final List<String?> _hints = [
    'Shoes',
    'Phones',
    'TV',
    'Camera',
  ];
  final int i = 0;

  @override
  Widget build(BuildContext context) {
    const Color selected = Colors.red;
    final Color? unselected = Colors.grey[700];

    Widget saleContainer = Container(
      padding: const EdgeInsets.all(5),
      width: 500,
      height: 270,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Text(
            'Tech Life Sale',
            style: TextStyle(
                color: Colors.white, fontSize: 27, fontWeight: FontWeight.w900),
          ),
          const Text(
            'Tech Boom Better Life',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.all(1),
            shrinkWrap: true,
            primary: false,
            // crossAxisSpacing: 1,
            // mainAxisSpacing: 8,
            crossAxisCount: 4,
            children: [
              offerCard('', 'Tech Life Sale', 'The Best Price Ever'),
            ],
          ),
        ],
      ),
    );
    Widget hotTab = ListView(
      // shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            children: [
              saleContainer,
              Container(
                padding: const EdgeInsets.only(top: 10),
                color: Colors.grey[200],
                child: Consumer<ProductsData>(
                  builder: (context, value, child) {
                    return value.list.isEmpty
                        ? const CircularProgressIndicator()
                        : CardsGrid();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: SizedBox(
            height: 35,
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: const OutlineInputBorder(),
                  labelText: _hints[i],
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: TextStyle(
                color: unselected,
                fontSize: 18,
              ),
              unselectedLabelStyle: TextStyle(color: unselected, fontSize: 15),
              unselectedLabelColor: unselected,
              labelColor: selected,
              isScrollable: true,
              indicatorColor: selected,
              tabs: const [
                Tab(text: 'Hot'),
                Tab(text: 'Men shoes'),
                Tab(text: 'Men Clothes'),
                Tab(text: 'Phones'),
                Tab(text: 'TVs'),
                Tab(text: 'Women shoes'),
                Tab(text: 'Electronics'),
                Tab(text: 'Earphones'),
              ],
            ),
          ),
        ),
        body: Center(
          child: TabBarView(
            children: [
              hotTab,
              const GridViewWidget(count: 5),
              const GridViewWidget(count: 5),
              const GridViewWidget(count: 5),
              const GridViewWidget(count: 5),
              const GridViewWidget(count: 5),
              const GridViewWidget(count: 5),
              const GridViewWidget(count: 5),
            ],
          ),
        ),
      ),
    );
  }
}
