import 'package:commerce_app/account.dart';
import 'package:commerce_app/cart.dart';
import 'package:commerce_app/category.dart';
import 'package:commerce_app/message.dart';
import 'package:flutter/material.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({Key? key}) : super(key: key);

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
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.w900),
                ),
                const Text(
                  'Tech Boom Better Life',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                GridView.count(
                  padding: const EdgeInsets.all(5),
                  shrinkWrap: true,
                  primary: false,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                  crossAxisCount: 4,
                  children: [
                    offerCard('', 'Tech Life Sale', 'The Best Price Ever'),
                  ],
                ),
              ],
            ),
          );
    Widget hotTab = Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 126,
                decoration: BoxDecoration(color: Colors.grey[100]),
              ),
            ],
          ),
          saleContainer,
          
        ],
      ),
    );
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: TabBar(
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
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: unselected,
              ),
            ),
          ],
        ),
        body: Center(
          child: TabBarView(
            children: [
              hotTab,
              Text('Men Shoes'),
              Text('Men Clothes'),
              Text('Phones'),
              Text('TVs'),
              Text('Women shoes'),
              Text('Electronics'),
              Text('Earphones'),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [
    const HomeTabs(),
    const CategoryPage(),
    const MessagePage(),
    const CartPage(),
    const AccountPage(),
  ];

  final Color? unselectedColor = Colors.grey[700];
  final Color? selectedColor = Colors.black;

  Column navBarColumn(
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
      body: pages[pageIndex],
      bottomNavigationBar: buildNavBar(context),
    );
  }
}
