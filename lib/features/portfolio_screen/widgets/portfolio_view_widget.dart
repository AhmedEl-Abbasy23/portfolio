import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class PortfolioViewWidget extends StatefulWidget {
  const PortfolioViewWidget({super.key});

  @override
  State<PortfolioViewWidget> createState() => _PortfolioViewWidgetState();
}

class _PortfolioViewWidgetState extends State<PortfolioViewWidget> {
  Timer? timer;
  bool isLoading = true;

  int visibleCards = 0;
  Set<int> revealedCards = {};

  void initTimer() {
    Future.delayed(const Duration(seconds: 4), () {
      _startDealingAnimation();
    });
  }

  void _startDealingAnimation() {
    isLoading = false;
    Timer.periodic(const Duration(milliseconds: 90), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (visibleCards < PortfolioData.projects.length) {
        setState(() {
          visibleCards++;
        });
      } else {
        timer.cancel();

        int index = 0;
        Timer.periodic(const Duration(milliseconds: 120), (revealTimer) {
          if (!mounted) {
            revealTimer.cancel();
            return;
          }

          if (index < PortfolioData.projects.length) {
            setState(() {
              revealedCards.add(index);
            });
            index++;
          } else {
            revealTimer.cancel();
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? PortfolioWaitingWidget()
        : LayoutBuilder(
            builder: (context, constraints) {
              const spacing = 8.0; // Space between cards
              const runSpacing = 12.0; // Space between rows
              const totalCards = 28;

              int crossAxisCount =
                  (constraints.maxWidth / 110).floor().clamp(2, 10);
              int rowCount = (totalCards / crossAxisCount).ceil();

              // Calculate card dimensions based on available space and spacing
              final cardHeight =
                  (constraints.maxHeight - (runSpacing * (rowCount - 1))) /
                      rowCount;
              final cardWidth = constraints.maxWidth / crossAxisCount - spacing;
              final aspectRatio = cardWidth / cardHeight;

              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: runSpacing,
                  childAspectRatio: aspectRatio,
                ),
                itemCount: visibleCards,
                itemBuilder: (context, index) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  transitionBuilder: (child, animation) {
                    final offsetAnimation = Tween<Offset>(
                      begin: const Offset(0, -0.3),
                      end: Offset.zero,
                    ).animate(animation);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: ScaleTransition(
                        scale: animation,
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      ),
                    );
                  },
                  child: revealedCards.contains(index)
                      ? ProjectCardWidget(
                          project: PortfolioData.projects[index],
                          key: ValueKey('image_$index'),
                        )
                      : ProjectCardWidget(
                          number: index + 1,
                          key: ValueKey('number_$index'),
                        ),
                ),
              );
            },
          );
  }
}
