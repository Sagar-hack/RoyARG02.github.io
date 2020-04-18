import 'package:flutter/material.dart';

//! for dummyText
import 'package:portfolio_source/static/info.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: _buildIntroHello(context),
                ),
                Expanded(
                  child: _buildIntroInfo(context),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: _buildIntroHello(context),
                ),
                _buildIntroInfo(context),
              ],
            );
          }
        },
      ),
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
