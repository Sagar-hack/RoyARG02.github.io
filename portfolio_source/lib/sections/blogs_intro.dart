import 'package:flutter/material.dart';

import 'package:portfolio_source/sections/section_skeleton.dart';

class BlogsIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionSkeletion(
      heading: Text(
        'Blogs',
        style: Theme.of(context).textTheme.headline3,
      ),
      content: SizedBox(),
    );
  }
}
