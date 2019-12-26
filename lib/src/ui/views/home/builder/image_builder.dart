import 'package:flutter/material.dart';
import 'package:flutter_cat_facts/src/ui/core/style/box_decoration.dart';
import 'package:flutter_cat_facts/src/ui/core/style/image_widget.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit boxFit;
  final bool fullScreen;

  const ImageCard({
    Key key,
    @required this.imageUrl,
    this.width,
    this.height,
    this.boxFit = BoxFit.fitHeight,
    this.fullScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeWidth = width ?? MediaQuery.of(context).size.width;
    double sizeHeight = height ?? MediaQuery.of(context).size.height * 0.4;
    if (!fullScreen)
      sizeHeight = sizeHeight > MediaQuery.of(context).size.height * 0.4
          ? MediaQuery.of(context).size.height * 0.4
          : sizeHeight;
    return Container(
      padding: EdgeInsets.all(10),
      decoration: boxDecoration(borderRadius: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          color: Colors.blueGrey,
          child: ImageNetwork(
            imageUrl: imageUrl,
            width: sizeWidth,
            height: sizeHeight,
            boxFit: boxFit,
          ),
        ),
      ),
    );
  }
}
