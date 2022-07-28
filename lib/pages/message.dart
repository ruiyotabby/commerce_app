import 'package:commerce_app/pages/category.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Message'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Row(children: const [
              Icon(Icons.help_outline),
              Text('FAQ'),
            ]),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              ListTile(
                tileColor: Colors.white,
                leading:
                    Icon(Icons.help_center, size: 40, color: Colors.purple),
                title: Text('Contact Us'),
                subtitle: Text('Describe your quesry'),
                trailing: Icon(Icons.navigate_next, size: 35),
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: [
                    Column(
                      children: [
                        MessageTiles(),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Text('Store Updates'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MessageTiles extends StatelessWidget {
  const MessageTiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _tiles('1', Icons.volume_up, Colors.yellow, 'Notifications',
            'No notification yet'),
        _tiles('2', Icons.edit_note, Colors.green, 'Notifications',
            'No notification yet'),
        _tiles('3', Icons.discount, Colors.deepOrange, 'Notifications',
            'No notification yet'),
      ],
    );
  }

  Widget _tiles(
      String key, IconData icon, Color color, String title, String subtitle) {
    return Column(
      children: [
        ListTile(
          //put keys on each tile for the on tap function.
          //Use the key to determine which tile was clicked and which page to open using a function
          key: Key(key),
          tileColor: Colors.white,
          leading: Icon(icon, size: 35, color: color),
          title: Text(title),
          subtitle: Text(subtitle),
          onTap: () {},
        ),
        const Divider(thickness: 1, height: 1),
      ],
    );
  }
}
