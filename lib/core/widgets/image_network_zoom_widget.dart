import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class ImageNetworkZoomWidget extends StatefulWidget {
  final String? imageUrl;

  const ImageNetworkZoomWidget({super.key, this.imageUrl});

  @override
  State<ImageNetworkZoomWidget> createState() => _ImageNetworkZoomWidgetState();
}

class _ImageNetworkZoomWidgetState extends State<ImageNetworkZoomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            50.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: const BackWidget(),
            ),
            70.ph,
            InteractiveViewer(
              panEnabled: true,
              boundaryMargin: const EdgeInsets.all(100),
              trackpadScrollCausesScale: true,
              minScale: 0.5,
              maxScale: 2,
              child: CachedImageWidget(
                imgUrl: widget.imageUrl!,
                circleShimmer: false,
                width: context.width,
                height: context.height * 0.6,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
