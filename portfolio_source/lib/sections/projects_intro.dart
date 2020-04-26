import 'package:flutter/material.dart';
import 'package:portfolio_source/sections/section_skeleton.dart';

class ProjectsIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionSkeletion(
      heading: Text(
        'Projects',
        style: Theme.of(context).textTheme.headline3,
      ),
      content: SizedBox(),
    );
  }
}
