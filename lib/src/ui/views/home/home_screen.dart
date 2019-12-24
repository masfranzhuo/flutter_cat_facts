import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cat_facts/src/blocs/random-image/bloc/bloc.dart';
import 'package:flutter_cat_facts/src/models/random_image_model.dart';

import 'builder/fact_card.dart';
import 'builder/image_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          BlocBuilder<RandomImageBloc, RandomImageState>(
              builder: (context, state) {
            if (state is LoadedRandomImageState) {
              RandomImage randomImage = state?.response?.data;
              print(randomImage.url);
              return ImageCard(imageUrl: randomImage?.url);
            } else
              return CircularProgressIndicator();
          }),
          FactCard(
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
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
