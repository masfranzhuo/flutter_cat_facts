import 'package:flutter/material.dart';
import 'package:flutter_cat_facts/src/ui/core/style/box_shadow.dart';

BoxDecoration boxDecoration({Color color, double borderRadius}) {
  return BoxDecoration(
    color: color ?? Colors.white,
    borderRadius: BorderRadius.circular(borderRadius ?? 4),
    boxShadow: [boxShadow()],
  );
}
