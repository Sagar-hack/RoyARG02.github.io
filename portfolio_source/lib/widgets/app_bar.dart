import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:portfolio_source/providers/common_parameters.dart';

class PortfolioAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double appBarExpandedHeight =
        Provider.of<CommonParameters>(context).appBarExpandedHeight;
    return SliverAppBar(
      expandedHeight: appBarExpandedHeight,
      pinned: true,
      title: Text('Anurag Roy'),
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Anurag Roy'),
        centerTitle: true,
      ),
    );
  }
}
