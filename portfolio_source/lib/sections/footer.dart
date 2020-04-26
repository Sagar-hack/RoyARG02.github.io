import 'package:flutter/material.dart';
import 'package:portfolio_source/widgets/footer_widgets.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: DefaultTextStyle(
        style: Theme.of(context).primaryTextTheme.caption,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Copyright(),
            FlutterWebInfo(),
          ],
        ),
      ),
    );
  }
}
