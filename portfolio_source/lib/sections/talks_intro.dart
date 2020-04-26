import 'package:flutter/material.dart';
import 'package:portfolio_source/sections/section_skeleton.dart';

class TalksIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionSkeletion(
      heading: Text(
        'Talks',
        style: Theme.of(context).textTheme.headline3,
      ),
      content: SizedBox(),
    );
  }
}
