import 'package:flutter/material.dart';

class FactCard extends StatelessWidget {
  final String text;

  const FactCard({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(text ?? ''),
    );
  }
}