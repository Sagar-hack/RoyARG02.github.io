import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('Hello World!', style: Theme.of(context).textTheme.headline1,),
    );
  }
}