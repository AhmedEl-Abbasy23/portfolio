import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    super.key,
    required this.imgUrl,
    required this.circleShimmer,
    this.withShimmer = true,
    this.isUserImg = false,
    this.withoutHeight = false,
    this.withoutWidth = false,
    required this.height,
    required this.width,
    this.radius = 0,
    this.fit = BoxFit.contain,
  });

  final String imgUrl;
  final bool circleShimmer;
  final bool withShimmer;
  final bool isUserImg;
  final bool withoutHeight;
  final bool withoutWidth;
  final double height;
  final double width;
  final double radius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: imgUrl.endsWith('.svg')
          ? SvgPicture.network(
              imgUrl,
              fit: fit,
              height: withoutHeight ? null : height,
              width: withoutWidth ? null : width,
              placeholderBuilder: withShimmer
                  ? (context) => circleShimmer
                      ? ShimmerWidget.circular(height: height, width: width)
                      : ShimmerWidget.rectangular(
                          height: height,
                          width: width,
                          withRadius: false,
                        )
                  : null,
            )
          : CachedNetworkImage(
              imageUrl: imgUrl,
              fit: fit,
              height: withoutHeight ? null : height,
              width: withoutWidth ? null : width,
              placeholder: withShimmer
                  ? (context, url) => circleShimmer
                      ? ShimmerWidget.circular(height: height, width: width)
                      : ShimmerWidget.rectangular(
                          height: height,
                          width: width,
                          withRadius: false,
                        )
                  : null,
              errorWidget: (context, url, error) => ClipRRect(
                borderRadius:
                    isUserImg ? BorderRadius.circular(50) : BorderRadius.zero,
                // TPDP.
                /*child: Image.asset(
                  isUserImg
                      ? Assets.imagesUserPlaceholder
                      : Assets.imagesPlaceholder,
                  fit: BoxFit.fill,
                ),*/
              ),
            ),
    );
  }
}
