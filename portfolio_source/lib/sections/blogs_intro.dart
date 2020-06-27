import 'package:flutter/material.dart';

import 'package:portfolio_source/sections/section.dart';

class BlogsIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionSkeletion(
      heading: Text(
        'Blogs',
      ),
      content: <Widget>[
        Text(
          'My occasionally written blogs deal with the nuances of various programming languages and the Flutter framework.',
        ),
      ],
    );
  }
}
