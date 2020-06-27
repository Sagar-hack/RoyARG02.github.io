import 'package:flutter/material.dart';
import 'package:portfolio_source/sections/section.dart';

class TalksIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionSkeletion(
      heading: Text(
        'Talks',
      ),
      content: <Widget>[
        Text(
          'Speaking isn\'t really my thing, but I\'m happy and always eager to share my knowledge with the community.',
        ),
      ],
    );
  }
}
