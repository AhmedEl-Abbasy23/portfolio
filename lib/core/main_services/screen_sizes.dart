import 'package:flutter/material.dart';

class Sizes {
  Sizes._();

  static Size getSize(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }

  static double getSizeInSaveArea(BuildContext context) {
    var totalHeight = MediaQuery.sizeOf(context).height;
    var paddingHeight = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;

    return totalHeight - paddingHeight;
  }

  static double getMobileNavigationBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double getMobileStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width > 0 &&
        MediaQuery.sizeOf(context).width <= 600;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.sizeOf(context).width > 600 &&
        MediaQuery.sizeOf(context).width <= 1024;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.sizeOf(context).width > 1024 &&
        MediaQuery.sizeOf(context).width <= 1440;
  }

  static bool isLargeDesktop(BuildContext context) {
    return MediaQuery.sizeOf(context).width > 1440;
  }
}
