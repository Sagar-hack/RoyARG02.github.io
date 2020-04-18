import 'package:flutter/material.dart';

class PortfolioAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.8,
      pinned: true,
      title: Text('Anurag Roy'),
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: [StretchMode.fadeTitle],
        title: Text('Anurag Roy'),
        centerTitle: true,
      ),
    );
  }
}
