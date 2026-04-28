import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/image_network_zoom_widget.dart';
import 'package:portfolio/exports.dart';

class AppsSliderWidget extends StatelessWidget {
  const AppsSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlutterCarousel(
        options: FlutterCarouselOptions(
          height: 600,
          viewportFraction: Sizes.isLargeDesktop(context) ? 0.5 : 0.4,
          autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
          showIndicator: true,
          autoPlay: true,
          enlargeCenterPage: true,
          initialPage: 0,
          pauseAutoPlayOnManualNavigate: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          indicatorMargin: 1,
          enableInfiniteScroll: true,
          slideIndicator: CircularSlideIndicator(
            slideIndicatorOptions: SlideIndicatorOptions(
              currentIndicatorColor: AppColors.waitingColor,
              enableAnimation: true,
              enableHalo: true,
            ),
          ),
        ),
        items: PortfolioData.imagesLocal.map((image) {
          return Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  context.push(
                    ImageNetworkZoomWidget(image: image),
                  );
                },
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: image.image(
                        height: 600,
                        width: context.width,
                        fit: BoxFit.contain,
                      ),
                    ),

                    PositionedDirectional(
                      top: 16,
                      start: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: AppColors.blackColor.withValues(alpha: 0.55),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.15),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MOBILE APP PROJECT',
                              style: AppTextStyles.whiteW400S16PxStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 13.fs,
                              ),
                            ),
                            4.ph,
                            Text(
                              'Flutter • Clean Architecture • UX',
                              style: AppTextStyles.whiteW400S16PxStyle.copyWith(
                                fontSize: 10.fs,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    PositionedDirectional(
                      bottom: 18,
                      end: 18,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.blackColor.withValues(alpha: 0.45),
                        ),
                        child: Text(
                          'Tap to explore',
                          style: AppTextStyles.whiteW400S16PxStyle.copyWith(
                            fontSize: 10.fs,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
              /* return Stack(
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
              );*/
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

