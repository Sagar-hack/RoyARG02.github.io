import 'package:flutter/material.dart';

import 'package:portfolio_source/sections/section.dart';
//! for dummyText
import 'package:portfolio_source/static/info.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionSkeletion(
      heading: Text('Hello! It\'s me, Anurag.'),
      content: <Widget>[
        Text(dummyText1),
        Text(dummyText2),
      ],
    );
  }
}
