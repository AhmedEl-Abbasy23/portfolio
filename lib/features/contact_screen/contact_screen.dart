import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key, this.onScrollDown});

  final VoidCallback? onScrollDown;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (context.height * 0.1).ph,
        /// Header
        Stack(
          alignment: Alignment.center,
          children: [
            Assets.lottie.portfolio.lottie(
              height: 260,
              fit: BoxFit.fitHeight,
            ),
            PositionedDirectional(
              bottom: 0,
              child: Column(
                children: [
                  Text(
                    'LET’S BUILD SOMETHING'.toUpperCase(),
                    style: AppTextStyles.whiteW400S16PxStyle.copyWith(
                      letterSpacing: 2,
                      color: Colors.white70,
                    ),
                  ),
                  4.ph,
                  Text(
                    'Get in Touch',
                    style: AppTextStyles.whiteW400S32PxStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        32.ph,
        /// Platforms
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width > 800 ? 60 : 20,
          ),
          child: FadeInLeft(
            duration: Duration(milliseconds: 800),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(
                PortfolioData.platforms.length,
                    (index) => ContactCardWidget(
                  title: PortfolioData.platforms[index],
                  icon: PortfolioData.icons[index],
                  onTap: () => _handleTap(index),
                ),
              ),
            ),
          ),
        ),

        32.ph,

        /// CTA Text
        Text(
          'Available for freelance & full-time opportunities',
          textAlign: TextAlign.center,
          style: AppTextStyles.whiteW400S16PxStyle.copyWith(
            color: Colors.white70,
          ),
        ),

        8.ph,

        Text(
          'Let’s create something people love 🚀',
          textAlign: TextAlign.center,
          style: AppTextStyles.whiteW400S18PxStyle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),

        Spacer(),

        /// Back to top
        FadeInUpBig(
          duration: Duration(milliseconds: 800),
          child: RiveAnimatedIcon(
            riveIcon: RiveIcon.arrowUp,
            width: 40,
            height: 50,
            color: AppColors.whiteColor.withValues(alpha: 0.7),
            strokeWidth: 2,
            loopAnimation: true,
            onTap: onScrollDown ?? () {},
            onHover: (value) {},
          ),
        ),
      ],
    );
  }

  /// Handle actions
  void _handleTap(int index) {
    switch (index) {
      case 0:
        launchUrl(Uri.parse('https://linkedin.com/in/YOUR_USERNAME'));
        break;
      case 1:
        launchUrl(Uri.parse('https://github.com/YOUR_USERNAME'));
        break;
      case 2:
        launchUrl(Uri.parse('mailto:ahmed.elabbasy23@gmail.com'));
        break;
      case 3:
        launchUrl(Uri.parse('https://wa.me/201288278807'));
        break;
    }
  }
}