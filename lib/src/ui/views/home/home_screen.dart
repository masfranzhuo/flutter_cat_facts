import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cat_facts/src/blocs/fact/bloc/bloc.dart';
import 'package:flutter_cat_facts/src/blocs/random-image/bloc/bloc.dart';
import 'package:flutter_cat_facts/src/models/random_image_model.dart';
import 'package:flutter_cat_facts/src/ui/core/loading_indicator_widget.dart';

import 'builder/fact_card.dart';
import 'builder/image_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  void _handlerShare() {}

  void _handlerNext() {
    BlocProvider.of<RandomImageBloc>(context).add(GetRandomImageEvent());
    BlocProvider.of<FactBloc>(context).add(GetFactEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          BlocBuilder<RandomImageBloc, RandomImageState>(
              builder: (context, state) {
            if (state is LoadedRandomImageState) {
              RandomImage randomImage = state?.response?.data;
              return ImageCard(imageUrl: randomImage?.url);
            } else
              return LoadingIndicator();
          }),
          BlocBuilder<FactBloc, FactState>(builder: (context, state) {
            if (state is LoadedFactState) {
              return FactCard(text: state.fact.text);
            } else
              return LoadingIndicator();
          }),
          Row(
            children: <Widget>[
              RaisedButton(
                child: Icon(Icons.share),
                onPressed: _handlerShare,
              ),
              RaisedButton(
                child: Icon(Icons.arrow_forward),
                onPressed: _handlerNext,
              ),
            ],
          )
        ],
      ),
    );
  }
}
