import 'package:flutter/material.dart';

/// Contains constant parameters to be used by the descendant widgets

class CommonParameters {
  final double appBarExpandedHeight;
  CommonParameters(BuildContext context)
      : appBarExpandedHeight = MediaQuery.of(context).size.height * 0.8;
}
