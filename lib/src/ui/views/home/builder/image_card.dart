import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final int width;
  final int height;

  const ImageCard({Key key, @required this.imageUrl, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: width ?? MediaQuery.of(context).size.width * 0.5,
        height: height ?? MediaQuery.of(context).size.height * 0.5,
        child: Image.network(imageUrl),
      ),
    );
  }
}
