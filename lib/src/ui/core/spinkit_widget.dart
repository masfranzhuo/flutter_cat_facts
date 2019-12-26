import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinkit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.25,
        child: SpinKitThreeBounce(
          color: Theme.of(context).accentColor,
          size: 25,
        ),
      ),
    );
  }
}
