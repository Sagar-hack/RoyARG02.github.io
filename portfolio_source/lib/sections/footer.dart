import 'package:flutter/material.dart';
import 'package:portfolio_source/widgets/footer_widgets.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      child: Container(
        height: 32.0,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: DefaultTextStyle(
          style: Theme.of(context).primaryTextTheme.caption,
          child: Copyright(),
        ),
      ),
    );
  }
}
