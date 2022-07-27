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
          onTap: (() => {}),
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

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            GridView.count(
              crossAxisCount: 5,
              crossAxisSpacing: 5,
              mainAxisSpacing: 10,
              childAspectRatio: 9 / 13,
              padding:
                  const EdgeInsets.only(bottom: 14, top: 8, left: 8, right: 8),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/images (31).jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      'label1',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/images (30).jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      'Label2',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
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
}
