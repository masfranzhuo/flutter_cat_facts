import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cat_facts/src/blocs/fact/bloc/bloc.dart';
import 'package:flutter_cat_facts/src/blocs/random-image/bloc/bloc.dart';
import 'package:flutter_cat_facts/src/models/fact_model.dart';
import 'package:flutter_cat_facts/src/models/random_image_model.dart';
import 'package:flutter_cat_facts/src/ui/core/button_widget.dart';
import 'package:flutter_cat_facts/src/ui/core/spinkit_widget.dart';
import 'package:flutter_cat_facts/src/ui/core/style/box_decoration.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:share/share.dart';

import 'builder/fact_builder.dart';
import 'builder/image_builder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDownloading = false;

  void _handlerShare(String text) {
    Share.share(text, subject: 'Did You Know?');
  }

  void _handlerNext() {
    BlocProvider.of<RandomImageBloc>(context).add(GetRandomImageEvent());
    BlocProvider.of<FactBloc>(context).add(GetFactEvent());
  }

  void _handlerDownload(Function setState, String imageUrl) async {
    try {
      setState(() {
        isDownloading = true;
      });
      var imageId = await ImageDownloader.downloadImage(imageUrl);
      if (imageId == null) {
        return;
      }
      setState(() {
        isDownloading = false;
      });
    } catch (error) {
      setState(() {
        isDownloading = false;
      });
      print(error);
    }
  }

  void _showFulllScreenImageDialog(
      {@required String imageUrl, double width, double height}) async {
    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => Dialog(
            child: Center(
              child: Stack(
                children: <Widget>[
                  ImageCard(
                    imageUrl: imageUrl,
                    width: width,
                    height: height,
                    boxFit: BoxFit.contain,
                    fullScreen: true,
                  ),
                  Positioned(
                    bottom: 12,
                    right: 12,
                    child: Button(
                      icon: Icons.file_download,
                      onPressed: () {
                        _handlerDownload(setState, imageUrl);
                      },
                      tooltip: 'Download Image',
                      isLoading: isDownloading,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).then(
      (_) => setState(() {
        isDownloading = false;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/background.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
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
                          _showFulllScreenImageDialog(
                            imageUrl: randomImage?.url,
                            width: randomImage?.width?.toDouble(),
                            height: randomImage?.height?.toDouble(),
                          );
                        },
                        child: ImageCard(
                          imageUrl: randomImage?.url,
                          width: randomImage?.width?.toDouble(),
                          height: randomImage?.height?.toDouble(),
                        ),
                      );
                    } else
                      return Spinkit();
                  },
                ),
                SizedBox(height: 30),
                Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                      decoration: boxDecoration(useBackgroundImage: true),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: boxDecoration(
                              color: Theme.of(context).accentColor,
                              useBoxShadow: false,
                            ),
                            child: Text(
                              'Did You Know?',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          BlocBuilder<FactBloc, FactState>(
                            builder: (context, state) {
                              if (state is LoadedFactState) {
                                return FactCard(text: state.fact.text);
                              } else
                                return Spinkit();
                            },
                          ),
                          SizedBox(height: 10),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Button(
                                icon: Icons.share,
                                onPressed: () {
                                  Fact fact =
                                      BlocProvider.of<FactBloc>(context).fact;
                                  _handlerShare(fact.text);
                                },
                                tooltip: 'Share',
                              ),
                              Button(
                                icon: Icons.refresh,
                                onPressed: _handlerNext,
                                tooltip: 'Another Fact',
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
        )
      ],
    );
  }
}
