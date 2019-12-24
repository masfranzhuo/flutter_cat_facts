import 'package:flutter/material.dart';

import 'builder/fact_card.dart';
import 'builder/image_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ImageCard(),
          FactCard(),
          Row(
            children: <Widget>[
              RaisedButton(
                child: Icon(Icons.share),
                onPressed: null,
              ),
              RaisedButton(
                child: Icon(Icons.arrow_forward),
                onPressed: null,
              ),
            ],
          )
        ],
      ),
    );
  }
}
