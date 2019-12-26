import 'package:flutter/material.dart';
import 'package:flutter_cat_facts/src/ui/core/loading_indicator_widget.dart';

import 'style/box_decoration.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final String tooltip;
  final bool isLoading;

  Button(
      {@required this.icon,
      this.onPressed,
      this.tooltip,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed ?? null,
        splashColor: Theme.of(context).primaryColor,
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(3),
          decoration: boxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: 80,
              useBoxShadow: false),
          child: Align(
            alignment: Alignment.center,
            child: Tooltip(
              message: tooltip ?? '',
              child: isLoading
                  ? LoadingIndicator(color: Colors.white)
                  : Icon(
                      icon,
                      color: Theme.of(context).primaryColor,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
