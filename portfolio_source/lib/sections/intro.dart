import 'package:flutter/material.dart';

import 'package:portfolio_source/sections/section_skeleton.dart';
//! for dummyText
import 'package:portfolio_source/static/info.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionSkeletion(
      heading: _buildIntroHello(context),
      content: _buildIntroInfo(context),
    );
  }
}

Widget _buildIntroHello(BuildContext context) => RichText(
      softWrap: true,
      text: TextSpan(
        text: 'Hello! It\'s me, Anurag.',
        style: Theme.of(context).textTheme.headline3,
      ),
    );

Widget _buildIntroInfo(BuildContext context) => Text(
      dummyText,
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.headline5,
    );
