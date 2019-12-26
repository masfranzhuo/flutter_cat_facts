import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cat_facts/src/ui/core/spinkit_widget.dart';

class ImageNetwork extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit boxFit;

  const ImageNetwork({
    Key key,
    @required this.imageUrl,
    this.width,
    this.height,
    this.boxFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: boxFit ?? BoxFit.contain,
          ),
        ),
      ),
      placeholder: (context, url) => Spinkit(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
