import 'package:flutter/material.dart';
import 'package:flutter_cat_facts/src/ui/core/style/box_decoration.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final int width;
  final int height;

  const ImageCard({Key key, @required this.imageUrl, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeWidth =
        width?.toDouble() ?? MediaQuery.of(context).size.width;
    double sizeHeight =
        height?.toDouble() ?? MediaQuery.of(context).size.height * 0.4;
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
          child: Image.network(
            imageUrl,
            width: sizeWidth,
            height: sizeHeight,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
