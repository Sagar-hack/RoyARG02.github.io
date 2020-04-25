import 'package:flutter/material.dart';

class AvatarBuilder extends StatelessWidget {
  const AvatarBuilder({
    @required this.maxAvatarRadius,
    @required this.shrinkOffset,
    @required this.minAvatarRadius,
    this.avatarBackgroundImage,
  });

  final double maxAvatarRadius;
  final double shrinkOffset;
  final double minAvatarRadius;
  final ImageProvider avatarBackgroundImage;

  Brightness getEffectiveBackgroundColor(BuildContext context) {
    return ThemeData.estimateBrightnessForColor(
        Theme.of(context).textTheme.subtitle1.color);
  }

  @override
  Widget build(BuildContext context) {
    final double avatarSizeExpansion = maxAvatarRadius - minAvatarRadius;
    final double avatarSize =
        maxAvatarRadius - (shrinkOffset * avatarSizeExpansion);
    // print(avatarSize);
    return Container(
      height: avatarSize,
      width: avatarSize,
      child: InkResponse(
        //disable taps unless the avatar takes the smallest size
        onTap: avatarSize - minAvatarRadius < 0.001
            ? () {
                print('Tapped');
              }
            : null,
        highlightShape: BoxShape.circle,
        radius: avatarSize,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: getEffectiveBackgroundColor(context) == Brightness.dark
                ? Theme.of(context).primaryColorLight
                : Theme.of(context).primaryColorDark,
            image: avatarBackgroundImage != null
                ? DecorationImage(
                    image: avatarBackgroundImage,
                    fit: BoxFit.cover,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
