import 'package:flutter/material.dart';

import 'data_words_list.dart';


class DisplayWordText extends StatelessWidget {

  final WordsList appData;

  const DisplayWordText({Key? key, required this.appData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.0,
          letterSpacing: 2.5,
        ),
        child: Stack(
          children: [
            Container(
              // height: double.infinity,
              // width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  appData.text,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
