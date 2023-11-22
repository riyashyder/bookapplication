import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'data_quotes_list.dart';
import 'display_quotes_text.dart';
import 'drawer_navigation.dart';


class PVQuotesText extends StatefulWidget {
  const PVQuotesText({Key? key}) : super(key: key);

  @override
  State<PVQuotesText> createState() => _PVQuotesTextState();
}

class _PVQuotesTextState extends State<PVQuotesText> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerNavigation(),
      appBar: AppBar(
        title: const Text('Quotes'),
        backgroundColor: Colors.blue,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text('Share'),
              ),
            ],
            elevation: 2,
            onSelected: (value) {
              if(value==1){
                shareinfo();
              }
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 50.0),
            height: 250.0,
            child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                controller: PageController(
                  viewportFraction: 0.7,
                ),
                itemCount: ThemeList.length,
                itemBuilder: (context, index) {
                  var quotes = ThemeList[index];
                  var _scale = _selectedIndex == index ? 1.0 : 0.8;
                  return TweenAnimationBuilder(
                      tween: Tween(begin: _scale, end: _scale),
                      duration: Duration(milliseconds: 350),
                      child: DisplayQuotesText(
                        appData: quotes,
                      ),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: new Text(
                  (_selectedIndex + 1).toString() +
                      '/' +
                      ThemeList.length.toString(),
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  shareinfo() {
    print('your quotes is shared');

    Share.share(ThemeList[_selectedIndex].text);
    print(ThemeList[_selectedIndex].text);
  }
}
