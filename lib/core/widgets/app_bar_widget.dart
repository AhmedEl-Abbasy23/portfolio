import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.toolbarHeight,
    required this.currentPageNotifier,
    required this.onWelcomeTapped,
    required this.onHomeTapped,
    required this.onAboutTapped,
    required this.onPortfolioTapped,
    required this.onContactTapped,
  });

  final double? toolbarHeight;
  final ValueNotifier<int> currentPageNotifier;
  final void Function() onWelcomeTapped;
  final void Function() onHomeTapped;
  final void Function() onAboutTapped;
  final void Function() onPortfolioTapped;
  final void Function() onContactTapped;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.blackColor,
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Padding(
          padding: EdgeInsetsDirectional.only(top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RiveAnimatedIcon(
                riveIcon: RiveIcon.profile,
                width: 50,
                height: 30,
                color: AppColors.whiteColor,
                strokeWidth: 3,
                loopAnimation: true,
                onTap: () {},
                onHover: (value) {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Ahmed Elabbasy',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 8, top: 18),
            child: ValueListenableBuilder<int>(
                valueListenable: currentPageNotifier,
                builder: (context, currentPage, _) {
                  return Row(
                    spacing: 12,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppButton(
                        backgroundColor: currentPage == 0
                            ? AppColors.primaryColor.withValues(alpha: 0.6)
                            : AppColors.blackColor,
                        width: 97,
                        buttonText: 'Welcome',
                        onPressed: onWelcomeTapped,
                      ),
                      AppButton(
                        backgroundColor: currentPage == 1
                            ? AppColors.primaryColor.withValues(alpha: 0.6)
                            : AppColors.blackColor,
                        width: 90,
                        buttonText: 'Home',
                        onPressed: onHomeTapped,
                      ),
                      AppButton(
                        backgroundColor: currentPage == 2
                            ? AppColors.primaryColor.withValues(alpha: 0.6)
                            : AppColors.blackColor,
                        width: 90,
                        buttonText: 'About',
                        onPressed: onAboutTapped,
                      ),
                      AppButton(
                        backgroundColor: currentPage == 3
                            ? AppColors.primaryColor.withValues(alpha: 0.6)
                            : AppColors.blackColor,
                        width: 94,
                        buttonText: 'Portfolio',
                        onPressed: onPortfolioTapped,
                      ),
                      AppButton(
                        backgroundColor: currentPage == 4
                            ? AppColors.primaryColor.withValues(alpha: 0.6)
                            : AppColors.blackColor,
                        width: 90,
                        buttonText: 'Contact',
                        onPressed: onContactTapped,
                      ),
                      AppButton(
                        isActive: false,
                        backgroundColor: AppColors.blackColor,
                        width: 128,
                        buttonText: 'Download CV',
                        onPressed: () {},
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? 70);
}
