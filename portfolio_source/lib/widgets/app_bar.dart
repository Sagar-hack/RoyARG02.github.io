import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:portfolio_source/providers/common_parameters.dart';
import 'package:portfolio_source/widgets/avatar_builder.dart';

const _titleFadeDuration = Duration(milliseconds: 70);

class PortfolioAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CommonParameters _commonParameters =
        Provider.of<CommonParameters>(context);
    return MediaQuery.removePadding(
      context: context,
      child: SliverPersistentHeader(
        pinned: true,
        delegate: _IosStyleMaterialSliverDelegete(
          expandedHeight: _commonParameters.appBarExpandedHeight,
          maxAvatarRadius: _commonParameters.appBarAvatarMaxRadius,
          title: Text('Anurag Roy'),
          forceElevated: true,
        ),
      ),
    );
  }
}

class _IosStyleMaterialSliverDelegete extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double maxAvatarRadius;
  final double minAvatarRadius;
  final Widget title;
  final bool forceElevated;
  final ImageProvider avatarBackgroundImage;
  _IosStyleMaterialSliverDelegete({
    @required this.expandedHeight,
    @required this.maxAvatarRadius,
    this.title,
    this.forceElevated = false,
    this.avatarBackgroundImage,
    this.minAvatarRadius,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final bool showExpandedTitle =
        maxExtent - (2 * kToolbarHeight) - shrinkOffset > 0.001;
    final double normalizedShrinkOffset =
        shrinkOffset / (maxExtent - minExtent);
    final double xAxisAvatarPosition = normalizedShrinkOffset;

    return Material(
      elevation: overlapsContent || forceElevated
          ? Theme.of(context).appBarTheme.elevation ?? 4.0
          : 0.0,
      color: Theme.of(context).primaryColor,
      child: DefaultTextStyle(
        style: Theme.of(context).primaryTextTheme.headline6,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: NavigationToolbar.kMiddleSpacing,
              bottom: NavigationToolbar.kMiddleSpacing,
              left: NavigationToolbar.kMiddleSpacing,
              right: NavigationToolbar.kMiddleSpacing,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedOpacity(
                  opacity: showExpandedTitle ? 1.0 : 0.0,
                  child: title,
                  duration: _titleFadeDuration,
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: _PersistentAppBar(
                title: title,
                isTitleVisible: !showExpandedTitle,
                minAvatarRadius: minAvatarRadius ?? 48.0,
              ),
            ),
            Positioned(
              left: NavigationToolbar.kMiddleSpacing,
              right: NavigationToolbar.kMiddleSpacing,
              top: 4.0,
              bottom: 4.0,
              child: Align(
                alignment: Alignment(xAxisAvatarPosition, 0.0),
                // does not uses CircleAvatar due to slow animation.
                child: AvatarBuilder(
                  maxAvatarRadius: maxAvatarRadius,
                  shrinkOffset: normalizedShrinkOffset,
                  minAvatarRadius: minAvatarRadius ?? 48.0,
                  avatarBackgroundImage: avatarBackgroundImage,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class _PersistentAppBar extends StatelessWidget {
  final Widget title;
  final bool isTitleVisible;
  final double minAvatarRadius;
  _PersistentAppBar(
      {this.title, this.isTitleVisible, @required this.minAvatarRadius});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: NavigationToolbar(
        leading: Padding(
          padding: const EdgeInsets.all(NavigationToolbar.kMiddleSpacing),
          child: AnimatedOpacity(
            opacity: isTitleVisible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 300),
            child: title,
          ),
        ),
        middle: ButtonBar(
          //TODO: use layoutbuilder
          layoutBehavior: ButtonBarLayoutBehavior.padded,
          mainAxisSize: MainAxisSize.min,
          children: [
            FlatButton(
              child: Text('One'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('Two'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('Three'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('Four'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('Five'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('Six'),
              onPressed: () {},
            ),
          ],
        ),
        middleSpacing: NavigationToolbar.kMiddleSpacing,
        centerMiddle: true,
      ),
    );
  }
}
