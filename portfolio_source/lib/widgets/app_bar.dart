import 'package:flutter/material.dart';

class PortfolioAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.8,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatar(
              radius:
                  MediaQuery.of(context).size.shortestSide * 0.1,
            ),
            Text('Portfolio'),
          ],
        ),
        centerTitle: true,
      ),
    );
  }
}
