import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:portfolio_source/providers/common_parameters.dart';
import 'package:portfolio_source/providers/theme_provider.dart';
import 'package:portfolio_source/widgets/avatar_builder.dart';

const _titleFadeDuration = Duration(milliseconds: 70);

class PortfolioAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CommonParameters _commonParameters =
        Provider.of<CommonParameters>(context);
    final double topPadding = MediaQuery.of(context).padding.top;
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: SliverPersistentHeader(
        pinned: true,
        delegate: _IosStyleMaterialSliverDelegate(
          expandedHeight: _commonParameters.appBarExpandedHeight,
          maxAvatarRadius: _commonParameters.appBarAvatarMaxRadius,
          title: Text('Anurag Roy'),
          forceElevated: true,
          topPadding: topPadding,
        ),
      ),
    );
  }
}

class _IosStyleMaterialSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double maxAvatarRadius;
  final double minAvatarRadius;
  final Widget title;
  final bool forceElevated;
  final ImageProvider avatarBackgroundImage;
  final double topPadding;
  _IosStyleMaterialSliverDelegate({
    @required this.expandedHeight,
    @required this.maxAvatarRadius,
    @required this.topPadding,
    this.title,
    this.avatarBackgroundImage,
    this.minAvatarRadius,
    this.forceElevated = false,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final bool showExpandedTitle =
        maxExtent - (2 * kToolbarHeight) - shrinkOffset > 0.001;
    //shrinkOffset has a max of maxExtent unlike specified in docs
    final double normalizedShrinkOffset =
        shrinkOffset >= (maxExtent - minExtent)
            ? 1.0
            : shrinkOffset / (maxExtent - minExtent);
    final double xAxisAvatarPosition = normalizedShrinkOffset;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Theme.of(context).primaryColorBrightness == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Material(
        elevation: overlapsContent || forceElevated
            ? Theme.of(context).appBarTheme.elevation ?? 4.0
            : 0.0,
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          top: true,
          bottom: false,
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
                    normalizedShrinkOffset: normalizedShrinkOffset,
                  ),
                ),
                Positioned(
                  left: NavigationToolbar.kMiddleSpacing,
                  right: NavigationToolbar.kMiddleSpacing,
                  top: 4.0,
                  bottom: 4.0,
                  child: Align(
                    alignment: Alignment(xAxisAvatarPosition, 0.0),
                    // does not use CircleAvatar due to slow animation.
                    child: AvatarBuilder(
                      maxAvatarRadius: maxAvatarRadius,
                      //shrinkOffset issue
                      normalizedShrinkOffset: normalizedShrinkOffset,
                      minAvatarRadius:
                          minAvatarRadius ?? kMinInteractiveDimension,
                      avatarBackgroundImage: avatarBackgroundImage,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + topPadding;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class _PersistentAppBar extends StatelessWidget {
  final Widget title;
  final bool isTitleVisible;
  final double normalizedShrinkOffset;
  _PersistentAppBar({
    this.title,
    this.isTitleVisible,
    @required this.normalizedShrinkOffset,
  });
  @override
  Widget build(BuildContext context) {
    final AppTheme _appTheme = Provider.of<AppTheme>(context);
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
        trailing: Padding(
          padding: EdgeInsets.only(
            right: normalizedShrinkOffset * 48.0 +
                NavigationToolbar.kMiddleSpacing,
          ),
          child: ButtonBar(
            //TODO: use layoutbuilder
            layoutBehavior: ButtonBarLayoutBehavior.padded,
            mainAxisSize: MainAxisSize.min,
            children: [
              FlatButton(
                child: Text('Blogs'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Talks'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Projects'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Resume'),
                onPressed: () {},
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedCrossFade(
                    duration: _titleFadeDuration,
                    firstChild: FaIcon(FontAwesomeIcons.moon),
                    secondChild: FaIcon(FontAwesomeIcons.sun),
                    crossFadeState: _appTheme.isDarkTheme(context)
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                  Switch(
                    value: _appTheme.isDarkTheme(context),
                    onChanged: (_) =>
                        Provider.of<AppTheme>(context, listen: false)
                            .toggleThemeMode(context),
                  ),
                ],
              ),
            ],
          ),
        ),
        middleSpacing: NavigationToolbar.kMiddleSpacing,
        centerMiddle: true,
      ),
    );
  }
}
