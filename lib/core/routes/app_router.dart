import 'package:portfolio/exports.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Route generateRoute(RouteSettings settings) {
    "Navigating to route: ${settings.name}".logIfDebug();
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.layoutScreen:
        return MaterialPageRoute(
          builder: (context) {
            return LayoutScreen();
          },
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                StorageHelper.getLanguagePrefs() == 'en'
                    ? 'Route not found'
                    : 'الصفحة غير موجودة',
              ),
            ),
          ),
        );
    }
  }

  static pop({dynamic result}) {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop(result);
    }
  }

  static Future<dynamic> push(
      String routeName, {
        arguments,
        bool replace = false,
        bool clean = false,
      }) {
    // clean => remove all previous routes
    // replace => replace the previous route with the new route
    // default => push the new route
    'Route=====>$routeName ${replace || clean ? 'using' : ''} ${replace ? 'replace' : ''}${clean ? 'clean' : ''}'
        .logIfDebug();
    if (clean) {
      return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, (_) => false, arguments: arguments);
    } else if (replace) {
      return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
    }
  }
}
