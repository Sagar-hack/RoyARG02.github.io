import 'package:flutter/material.dart';

class SectionSkeletion extends StatelessWidget {
  final Widget heading;
  final List<Widget> content;
  SectionSkeletion({@required this.heading, @required this.content});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1024) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 470.0,
                    child: DefaultTextStyle(
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline3,
                      child: heading,
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      /// for every member of [content], add a padding at the bottom
                      children: content
                          .map<Widget>(
                            (Widget e) => DefaultTextStyle(
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.headline5,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: e,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                  child: heading,
                ),

                /// for every member of [content], add a padding at the top
                ...content
                    .map<Widget>(
                      (Widget e) => DefaultTextStyle(
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline5,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: e,
                        ),
                      ),
                    )
                    .toList()
              ],
            );
          }
        },
      ),
    );
  }
}
