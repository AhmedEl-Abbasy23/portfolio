import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/helpers/extension.dart';

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

  // -- FOR TESTING PURPOSES ONLY --
  static void printScreenInfo(BuildContext context) {
    final size = getSize(context);
    String type;

    if (isMobile(context)) {
      type = 'Mobile';
    } else if (isTablet(context)) {
      type = 'Tablet';
    } else if (isDesktop(context)) {
      type = 'Desktop';
    } else if (isLargeDesktop(context)) {
      type = 'Large Desktop';
    } else {
      type = 'Unknown';
    }

    '🖥️ Screen width: ${size.width.toStringAsFixed(1)}, '
        'height: ${size.height.toStringAsFixed(1)}, type: $type'.logIfDebug();
  }
}

class AppDimensions {
  // Scale factor based on the current platform dynamically
  static double _getScaleFactor() {
    double screenWidth = window.physicalSize.width / window.devicePixelRatio;

    String platform = (screenWidth <= 600)
        ? 'mobile'
        : (screenWidth <= 1024)
        ? 'tablet'
        : (screenWidth <= 1440)
        ? 'desktop'
        : 'largeDesktop';

    return {
      'mobile': 0.7,
      'tablet': 0.8,
      'desktop': 1.0,
      'largeDesktop': 1.2,
    }[platform]!;
  }

  static double scale(double fontSize) => fontSize * _getScaleFactor();

  // "-- FOR TESTING PURPOSES ONLY --"
  static void printScaleInfo() {
    double scaleFactor = _getScaleFactor();
    '📏 Current scale factor: ${scaleFactor.toStringAsFixed(2)}\n value of 19.fs is ${19.fs}'.logIfDebug();
  }
}

// Extension to easily scale font sizes dynamically
extension FontSizeExtension on num {
  double get fs => AppDimensions.scale(toDouble());
}
