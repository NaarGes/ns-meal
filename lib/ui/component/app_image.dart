import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ns_meal/config/theme/assets.dart';
import 'package:ns_meal/util/strings.dart';

class AppImage extends StatelessWidget {
  final String? tag;
  final String? url;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const AppImage({
    super.key,
    this.url,
    this.tag,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag ?? Strings.emptyString,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: CachedNetworkImage(
          width: width,
          height: height,
          fit: BoxFit.cover,
          imageUrl: url ?? Strings.emptyString,
          placeholder: (context, url) => Image.asset(Assets.plate),
          errorWidget: (context, url, error) => Image.asset(Assets.plate),
        ),
      ),
    );
  }
}
