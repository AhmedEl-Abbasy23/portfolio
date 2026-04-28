import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await setupDI();
  await CursorManager.init();
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ahmed Elabbasy - Portfolio',
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: const [
            Breakpoint(start: 0, end: 600, name: MOBILE),
            Breakpoint(start: 600, end: 1024, name: TABLET),
            Breakpoint(start: 1024, end: 1440, name: DESKTOP),
            Breakpoint(start: 1440, end: double.infinity, name: 'LARGE_DESKTOP'),
          ],
        );
      },
      initialRoute: Routes.layoutScreen,
      onGenerateRoute: appRouter.generateRoute,
      navigatorKey: AppRouter.navigatorKey,
    );
  }
}
