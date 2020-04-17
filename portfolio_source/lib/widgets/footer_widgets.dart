import 'package:flutter/material.dart';
import 'package:portfolio_source/static/info.dart';

class Copyright extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(copyrightInfo);
  }
}

class FlutterWebInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Built with '),
        FlutterLogo(),
        Text(' web'),
      ],
    );
  }
}
