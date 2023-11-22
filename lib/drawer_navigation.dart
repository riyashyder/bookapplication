import 'package:book_application/quotes_text_pv.dart';
import 'package:book_application/theme_text_pv.dart';
import 'package:book_application/word_text_pv.dart';
import 'package:flutter/material.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('No excuses : the power of self-discipline'),
              accountEmail: Text('Version 1.0'),
              currentAccountPicture: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/author.jpg'),
              ),
            ),
            ListTile(
              title: const Text('Quotes'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PVQuotesText()));
              },
            ),
            ListTile(
              title: const Text('Themes'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PVThemeText()));
              },
            ),
            ListTile(
              title: const Text('Words'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PVWordText()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
