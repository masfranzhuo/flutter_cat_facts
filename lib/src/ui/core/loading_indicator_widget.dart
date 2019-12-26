import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final Color color;

  LoadingIndicator({this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
          valueColor:
              color != null ? AlwaysStoppedAnimation<Color>(color) : null),
    );
  }
}
