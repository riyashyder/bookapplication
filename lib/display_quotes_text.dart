

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data_quotes_list.dart';

class DisplayQuotesText extends StatelessWidget {
  final QuotesList appData;

  const DisplayQuotesText({Key? key, required this.appData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.0,
          letterSpacing: 2.5,
        ),
        child: Stack(
          children: [
            Container(
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
