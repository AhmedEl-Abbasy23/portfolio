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
        titleSpacing: context.width > 512 ? null : 0,
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
                    if (context.width > 710)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Ahmed Elabbasy',
                          style: AppTextStyles.whiteW400S24PxStyle.copyWith(
                            fontSize: 22.fs,
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
                        horizontalPadding: _getButtonPadding(context),
                        buttonText: 'Welcome',
                        onPressed: onWelcomeTapped,
                      ),
                      AppButton(
                        backgroundColor: currentPage == 1
                            ? AppColors.primaryColor.withValues(alpha: 0.6)
                            : AppColors.blackColor,
                        horizontalPadding: _getButtonPadding(context),
                        buttonText: 'Home',
                        onPressed: onHomeTapped,
                      ),
                      AppButton(
                        backgroundColor: currentPage == 2
                            ? AppColors.primaryColor.withValues(alpha: 0.6)
                            : AppColors.blackColor,
                        horizontalPadding: _getButtonPadding(context),
                        buttonText: 'About',
                        onPressed: onAboutTapped,
                      ),
                      AppButton(
                        backgroundColor: currentPage == 3
                            ? AppColors.primaryColor.withValues(alpha: 0.6)
                            : AppColors.blackColor,
                        horizontalPadding: _getButtonPadding(context),
                        buttonText: 'Portfolio',
                        onPressed: onPortfolioTapped,
                      ),
                      AppButton(
                        backgroundColor: currentPage == 4
                            ? AppColors.primaryColor.withValues(alpha: 0.6)
                            : AppColors.blackColor,
                        horizontalPadding: _getButtonPadding(context),
                        buttonText: 'Contact',
                        onPressed: onContactTapped,
                      ),
                      AppButton(
                        isActive: true,
                        backgroundColor: AppColors.blackColor,
                        horizontalPadding: _getButtonPadding(context),
                        buttonText: 'Download CV',
                        onPressed: () async {
                          final uri = Uri.parse(
                            'https://drive.google.com/uc?export=download&id=1wHWJjo3_3SbQotvK7-C6iZEtlBWpiCvW',
                          );
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri, mode: LaunchMode.externalApplication);
                          }
                        },
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

double _getButtonPadding(BuildContext context) {
  if (Sizes.isMobile(context)) return 6;
  if (Sizes.isTablet(context)) return 8;
  if (Sizes.isDesktop(context)) return 12;
  return 16; // Large Desktop
}
