import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cat_facts/src/blocs/fact/bloc/bloc.dart';
import 'package:flutter_cat_facts/src/blocs/random-image/bloc/bloc.dart';
import 'package:flutter_cat_facts/src/models/random_image_model.dart';
import 'package:flutter_cat_facts/src/ui/core/loading_indicator_widget.dart';
import 'package:flutter_cat_facts/src/ui/core/style/box_decoration.dart';

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
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: Column(
          children: <Widget>[
            BlocBuilder<RandomImageBloc, RandomImageState>(
              builder: (context, state) {
                if (state is LoadedRandomImageState) {
                  RandomImage randomImage = state?.response?.data;
                  return GestureDetector(
                    onTap: () {
                      // TODO: full size screen
                    },
                    child: ImageCard(
                      imageUrl: randomImage?.url,
                      width: randomImage?.width,
                      height: randomImage?.height,
                    ),
                  );
                } else
                  return LoadingIndicator();
              },
            ),
            SizedBox(height: 30),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: boxDecoration(color: Colors.black87),
                  child: Text(
                    'Did You Know?',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: boxDecoration(),
                  child: Column(
                    children: <Widget>[
                      BlocBuilder<FactBloc, FactState>(
                        builder: (context, state) {
                          if (state is LoadedFactState) {
                            return FactCard(text: state.fact.text);
                          } else
                            return LoadingIndicator();
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          // TODO: custom icon button
                          IconButton(
                            icon: Container(
                              decoration: boxDecoration(
                                  color: Colors.black87, borderRadius: 50),
                              padding: EdgeInsets.all(4),
                              child: Icon(Icons.share,
                                  color: Theme.of(context).primaryColor),
                            ),
                            onPressed: _handlerShare,
                          ),
                          IconButton(
                            icon: Container(
                              decoration: boxDecoration(
                                  color: Colors.black87, borderRadius: 50),
                              padding: EdgeInsets.all(4),
                              child: Icon(Icons.arrow_forward_ios,
                                  color: Theme.of(context).primaryColor),
                            ),
                            onPressed: _handlerNext,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
