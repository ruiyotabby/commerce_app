import 'package:flutter/material.dart';

class CardsGrid extends StatefulWidget {
  const CardsGrid({Key? key}) : super(key: key);

  @override
  State<CardsGrid> createState() => _CardsGridState();
}

class _CardsGridState extends State<CardsGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 11 / 17,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.pushNamed(context, ItemCard.routeName);
            });
          },
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/images (50).jpeg', fit: BoxFit.fill),
                Text(
                  'Name of the item',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const Text(
                  "Ksh 0000",
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.orange[900],
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.orange[900],
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.orange[900],
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.orange[900],
                        ),
                        Icon(
                          Icons.star_half,
                          size: 15,
                          color: Colors.orange[900],
                        ),
                        Text(
                          '(000)',
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_outline),
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key, required this.count}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            GridView.count(
              crossAxisCount: count,
              crossAxisSpacing: 5,
              mainAxisSpacing: 10,
              childAspectRatio: 9 / 13,
              padding:
                  const EdgeInsets.only(bottom: 14, top: 8, left: 8, right: 8),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                gridViewColumn('assets/images/images (31).jpeg', 'Label1'),
                gridViewColumn('assets/images/images (30).jpeg', 'Label2')
              ],
            ),
            Container(
              padding: const EdgeInsets.all(6),
              color: Colors.grey[200],
              child: const CardsGrid(),
            )
          ],
        ),
      ],
    );
  }

  Widget gridViewColumn(String image, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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

class ItemCard extends StatefulWidget {
  const ItemCard({Key? key}) : super(key: key);

  static String routeName = '/item_page';

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  static int _num = 1;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget bottomRow() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: width * 0.346,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {}, child: Icon(Icons.message_outlined)),
                GestureDetector(
                    onTap: () {}, child: Icon(Icons.favorite_border)),
                GestureDetector(
                    onTap: () {}, child: Icon(Icons.shopping_cart_outlined)),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    bottomSheet(context, width, height);
                  });
                },
                child: Text('Add to Cart'),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(69),
                          bottomLeft: Radius.circular(69))),
                  primary: Colors.red,
                  side: BorderSide(color: Colors.red, width: 2),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    bottomSheet(context, width, height);
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(69),
                        bottomRight: Radius.circular(69)),
                  ),
                  primary: Colors.red,
                ),
                child: Text('Order Now'),
              ),
            ],
          ),
        ],
      );
    }

    PreferredSizeWidget cardAppBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      title: SizedBox(
        height: height * 0.06,
        width: width * 0.55,
        child: TextField(
          enabled: false,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, size: 30),
            labelText: 'Search products',
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(69)),
          ),
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.share)),
        IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ],
    );
    Widget productCard = Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 11, top: 8, right: 8, left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: height * 0.03),
            Text(
              'KSh 790',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: height * 0.013),
            Text(
              'scjnn nnnnnnnnn ncscsnkcnxncj ndkcjn djvcnushdi ewicnhuerh isjiytiohbn udfhisehgn cufddu idhnvu duindv ndfvi',
              softWrap: true,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 17,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.orange[900],
                    ),
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.orange[900],
                    ),
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.orange[900],
                    ),
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.orange[900],
                    ),
                    Icon(
                      Icons.star_half,
                      size: 18,
                      color: Colors.orange[900],
                    ),
                    SizedBox(width: width * 0.02),
                    Text('4.6'),
                    VerticalDivider(thickness: 1.5),
                    // SizedBox(width: width * 0.03),
                    Text(
                      'Reviews(12)',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: 13),
            SizedBox(height: height * 0.01),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'Color: Black/Size: 15 inch',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

    Widget shippingCard = Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 13, left: 8, right: 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping to',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Row(
                  children: [
                    Text(
                      'Nairobi, Central Business District',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Icon(
                      Icons.navigate_next,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: height * 0.018),
            Text(
              'This product ships from ecommerce\'s warehouse. Get it between monday and friday',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            // SizedBox(height: height * 0.02)
          ],
        ),
      ),
    );

    Widget reviewsCard = Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Customer Reviews',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(width: width * 0.015),
                    Text(
                      '(0)',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'View All',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                )
              ],
            ),
            Divider(thickness: 1),
            ListTile(title: Text('No reviews yet')),
          ],
        ),
      ),
    );

    Widget sellerCard = Card(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 13, top: 12, right: 8, left: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.1,
                      child: Image.network('src', fit: BoxFit.contain),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          'Last seen 5 days ago',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Visit Store'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(69))),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13, bottom: 13),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          '4.6',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          'Score',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    VerticalDivider(thickness: 1.5),
                    Column(
                      children: [
                        Text(
                          '20',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          'All Products',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    VerticalDivider(thickness: 1.5),
                    Column(
                      children: [
                        Text(
                          '84',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          'Followers',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Chat with this seller'),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 225, 222),
                      primary: Colors.red[700],
                      side: BorderSide(color: Colors.red),
                      fixedSize: Size(width * 0.51, height * 0.01)),
                )
              ],
            )
          ],
        ),
      ),
    );
    Widget descriptionCard = Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 14, left: 5),
            child: Row(
              children: [
                Text('Product Descriprion'),
              ],
            ),
          ),
          Image.network('', fit: BoxFit.contain),
          SizedBox(height: height * 0.02)
        ],
      ),
    );
    return Scaffold(
      appBar: cardAppBar,
      body: Center(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/images (38).jpeg',
                  fit: BoxFit.contain,
                ),
                productCard,
                SizedBox(height: height * 0.01),
                shippingCard,
                SizedBox(height: height * 0.01),
                reviewsCard,
                SizedBox(height: height * 0.01),
                sellerCard,
                SizedBox(height: height * 0.01),
                descriptionCard,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('You may also like'),
                ),
                CardsGrid()
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomRow(),
    );
  }

  Future<dynamic> bottomSheet(
      BuildContext context, double width, double height) {
    return showModalBottomSheet(
      context: context,
      builder: ((context) {
        return StatefulBuilder(builder: (context, StateSetter changeState) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              changeState(() {
                                if (_num >= 1) {
                                  _num--;
                                }
                              });
                            },
                            child: Icon(Icons.remove)),
                      ],
                    ),
                    SizedBox(width: width * 0.02),
                    Column(
                      children: [
                        Text('$_num'),
                      ],
                    ),
                    SizedBox(width: width * 0.02),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            changeState(() {
                              _num++;
                            });
                          },
                          child: Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(69)),
                          fixedSize: Size(width * 0.97, height * 0.019)),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
      }),
    );
  }
}
