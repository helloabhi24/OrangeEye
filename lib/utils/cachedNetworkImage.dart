import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

cacheNetworkImage({
  required String imageUrl,
  required double height,
  BoxFit boxfit = BoxFit.contain,
  double width = 0,
  Function? ontap,
  Function? imageBuilder,
  int? memCacheHeight,
  int? memCacheWidth,
}) {
  return GestureDetector(
    onTap: () {
      ontap!();
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CachedNetworkImage(
        filterQuality: FilterQuality.none,
        useOldImageOnUrlChange: true,
        height: height,
        fit: boxfit,
        imageUrl: imageUrl,
        width: width,
        placeholder: (context, url) => const Center(
            child: RepaintBoundary(child: CircularProgressIndicator())),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        memCacheHeight: memCacheHeight,
        memCacheWidth: memCacheWidth,
      ),
    ),
  );
}
