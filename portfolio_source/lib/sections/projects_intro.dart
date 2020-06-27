import 'package:flutter/material.dart';
import 'package:portfolio_source/sections/section.dart';

class ProjectsIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionSkeletion(
      heading: Text(
        'Projects',
      ),
      content: <Widget>[
        Text('The projects that I\'ve worked and collaborated with.'),
      ],
    );
  }
}
