import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class AppsSliderWidget extends StatelessWidget {
  const AppsSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlutterCarousel(
        options: FlutterCarouselOptions(
          height: 360,
          viewportFraction: 0.6,
          autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
          showIndicator: true,
          autoPlay: true,
          enlargeCenterPage: true,
          initialPage: 1,
          pauseAutoPlayOnManualNavigate: true,
          autoPlayAnimationDuration: Duration(milliseconds: 250),
          indicatorMargin: 1,
          slideIndicator: CircularSlideIndicator(
            slideIndicatorOptions: SlideIndicatorOptions(
              currentIndicatorColor: AppColors.waitingColor,
              enableAnimation: true,
              enableHalo: true,
            ),
          ),
        ),
        items: images.map((image) {
          return Builder(
            builder: (context) {
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedImageWidget(
                      imgUrl: image,
                      circleShimmer: false,
                      height: 360,
                      width: context.width,
                      radius: 16,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(16),
                      ),
                      color: AppColors.blackColor.withValues(
                        alpha: 0.6,
                      ),
                    ),
                    child: Text(
                      'App Name\nType\nDescription'.toUpperCase(),
                      textAlign: TextAlign.justify,
                      style: AppTextStyles.whiteW400S16PxStyle,
                    ),
                  ),
                ],
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

final List<String> images = [
  'https://storage.googleapis.com/screenshots-pro/public/iphone_15_revolut.png',
  'https://storage.googleapis.com/screenshots-pro/public/rainbow.png',
  'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/148239281/original/4a46309fc20c93f58c4dbcd578b05b18f9262b94/design-stunning-screenshot-for-app-store-and-play-store.jpg',
  'https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto/gigs/304333959/original/1a315f8e4447e3d0c44a49f7a8e9486e7690268d/design-app-screenshots-for-app-store-and-play-store.png',
];