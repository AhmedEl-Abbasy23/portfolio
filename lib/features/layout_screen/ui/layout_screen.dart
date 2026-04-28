import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final PageController pageController = PageController(initialPage: 4); // TODO. 0
  final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(4);// TODO. 0

  bool isAnimating = false;

  void _onScroll(PointerScrollEvent event) {
    if (isAnimating) return;

    final scroll = event.scrollDelta.dy;

    if (scroll > 0) {
      // Scroll down
      if (pageController.page!.round() < 5 - 1) { // 5 sections
        _goToPage(pageController.page!.toInt() + 1);
      }
    } else if (scroll < 0) {
      // Scroll up
      if (pageController.page!.round() > 0) {
        _goToPage(pageController.page!.toInt() - 1);
      }
    }
  }

  void _goToPage(int pageIndex, {withLongAnimation = false}) {
    isAnimating = true;
    pageController
        .animateToPage(
      pageIndex,
      duration: Duration(milliseconds: withLongAnimation ? 1500 : 5),
      curve: Curves.fastEaseInToSlowEaseOut,
    ).then((_) {
      isAnimating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBarWidget(
        currentPageNotifier: currentPageNotifier,
        onWelcomeTapped: () {
          if (pageController.page!.round() != 0) {
            _goToPage(0, withLongAnimation: true);
          }
        },
        onHomeTapped: () {
          if (pageController.page!.round() != 1) {
            _goToPage(1, withLongAnimation: true);
          }
        },
        onAboutTapped: () {
          if (pageController.page!.round() != 2) {
            _goToPage(2, withLongAnimation: true);
          }
        },
        onPortfolioTapped: () {
          if (pageController.page!.round() != 3) {
            _goToPage(3, withLongAnimation: true);
          }
        },
        onContactTapped: () {
          if (pageController.page!.round() != 4) {
            _goToPage(4, withLongAnimation: true);
          }
        },
      ),
      body: Listener(
        onPointerSignal: (event) {
          if (event is PointerScrollEvent) {
            _onScroll(event);
          }
        },
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: pageController,
          itemCount: 5,
          onPageChanged: (int newIndex) {
            currentPageNotifier.value = newIndex;
          },
          itemBuilder: (context, index) {
            return [
              WelcomeScreen(
                onScrollDown: () {
                  _goToPage(1, withLongAnimation: true);
                },
              ),
              HomeScreen(
                onScrollDown: () {
                  _goToPage(2, withLongAnimation: true);
                },
              ),
              AboutScreen(
                onScrollDown: () {
                  _goToPage(3, withLongAnimation: true);
                },
              ),
              PortfolioScreen(
                onScrollDown: () {
                  _goToPage(4, withLongAnimation: true);
                },
              ),
              ContactScreen(
                onScrollDown: () {
                  // 4 is the last page
                  _goToPage(0, withLongAnimation: true);
                },
              ),
            ][index];
          },
        ),
      ),
    );
  }
}
