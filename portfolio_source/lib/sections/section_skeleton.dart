import 'package:flutter/material.dart';

class SectionSkeletion extends StatelessWidget {
  final Widget heading;
  final Widget content;
  SectionSkeletion({@required this.heading, @required this.content});
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.4,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(24.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1024) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    right: 24.0,
                  ),
                  child: heading,
                ),
                Expanded(
                  child: content,
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: heading,
                ),
                content,
              ],
            );
          }
        },
      ),
    );
  }
}
