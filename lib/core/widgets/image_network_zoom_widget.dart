import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class ImageNetworkZoomWidget extends StatefulWidget {
  final String? imageUrl;
  final AssetGenImage? image;

  const ImageNetworkZoomWidget({super.key, this.imageUrl, this.image});

  @override
  State<ImageNetworkZoomWidget> createState() => _ImageNetworkZoomWidgetState();
}

class _ImageNetworkZoomWidgetState extends State<ImageNetworkZoomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            16.ph,
            const BackWidget(),
            8.ph,
            InteractiveViewer(
              panEnabled: true,
              boundaryMargin: const EdgeInsets.all(20),
              trackpadScrollCausesScale: true,
              minScale: 1,
              maxScale: 2.5,
              child: widget.imageUrl != null ?
              CachedImageWidget(
                imgUrl: widget.imageUrl!,
                circleShimmer: false,
                width: context.width,
                height: context.height * 0.6,
                fit: BoxFit.fitWidth,
              ) : ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: widget.image!.image(
                  height: 900,
                  width: context.width,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            16.ph,
          ],
        ),
      ),
    );
  }
}
