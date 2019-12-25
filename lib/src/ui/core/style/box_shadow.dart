import 'package:flutter/material.dart';

BoxShadow boxShadow() {
  return BoxShadow(
    color: Colors.black38,
    blurRadius: 5, // has the effect of softening the shadow
    spreadRadius: 0.5, // has the effect of extending the shadow
    offset: Offset(
      3, // horizontal, move right 10
      3, // vertical, move down 10
    ),
  );
}
