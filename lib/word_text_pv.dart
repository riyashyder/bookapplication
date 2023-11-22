import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'data_words_list.dart';
import 'display_word_text.dart';
import 'drawer_navigation.dart';


class PVWordText extends StatefulWidget {
  const PVWordText({Key? key}) : super(key: key);

  @override
  State<PVWordText> createState() => _PVWordTextState();
}

class _PVWordTextState extends State<PVWordText> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerNavigation(),
      appBar: AppBar(
        title: Text('Words'),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 50.0),
              height: 400,
              child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  controller: PageController(
                    viewportFraction: 0.7,
                  ),
                  itemCount: wordsList.length,
                  itemBuilder: (context, index) {
                    var word = wordsList[index];
                    var _scale = _selectedIndex == index ? 1.0 : 0.8;

                    return TweenAnimationBuilder(
                        tween: Tween(begin: _scale, end: _scale),
                        duration: Duration(milliseconds: 350),
                        child: DisplayWordText(appData: word),
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: value,
                            child: child,
                          );
                        });
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: new Text(
                  (_selectedIndex + 1).toString() +
                      '/' +
                      wordsList.length.toString(),
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  shareinfo() {
    print('your theme is shared');

    Share.share(wordsList[_selectedIndex].text);
    print(wordsList[_selectedIndex].text);
  }
}
