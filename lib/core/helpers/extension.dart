import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

extension Navigation on BuildContext {
  Future<dynamic> push(screen) {
    return Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  Future<dynamic> pushReplacement(screen) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  Future<dynamic> pushAndRemoveUntil(screen,
      {required RoutePredicate predicate}) {
    return Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
        predicate);
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this, rootNavigator: true).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this, rootNavigator: true)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  void pop() => Navigator.of(this).pop();
}

extension SpaceExtension on num {
  SizedBox get ph => SizedBox(height: toDouble());

  SizedBox get pw => SizedBox(width: toDouble());
}


extension ContextExtensions on BuildContext {
  // size
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
  double get bottomNavBarHeight => MediaQuery.paddingOf(this).bottom;
  double get mobileTopBarHeight => MediaQuery.paddingOf(this).top;

  // theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  bool get isLight => Theme.of(this).brightness == Brightness.light;
}


extension ToDouble on String {
  double doubleParse() => double.tryParse(this) ?? 0;
}

extension DebugLog on String {
  void logIfDebug() {
    if (kDebugMode) {
      log('⚠️ $this');
    }
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", ""); //0xff012547
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}