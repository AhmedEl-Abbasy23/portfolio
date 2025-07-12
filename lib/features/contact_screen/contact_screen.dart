import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key, this.onScrollDown});

  final VoidCallback? onScrollDown;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Assets.lottie.portfolio.lottie(
              height: 280,
              width: 500,
              fit: BoxFit.fitHeight,
            ),
            PositionedDirectional(
              bottom: 0,
              child: Text(
                'Get in Touch'.toUpperCase(),
                textAlign: TextAlign.justify,
                style: AppTextStyles.whiteW400S32PxStyle,
              ),
            ),
          ],
        ),
        24.ph,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            spacing: 16,
            children: List.generate(
              platforms.length,
              (index) => Expanded(
                child: InkWell(
                  onTap: () {
                  },
                  child: Container(
                    height: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      children: [
                        FaIcon(
                          icons[index],
                          size: 50,
                          color: index == 0 ? AppColors.urlColor : index == 3 ? Colors.green : Colors.black,
                        ),
                        Text(
                          platforms[index],
                          style: AppTextStyles.blackW700S14PxStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        30.ph,
        Text(
          'Let\'s work together, to create something amazing'
              .toUpperCase(),
          textAlign: TextAlign.justify,
          style: AppTextStyles.whiteW400S18PxStyle,
        ),
        Spacer(),
        FadeInUpBig(
          duration: Duration(seconds: 10),
          child: RiveAnimatedIcon(
            riveIcon: RiveIcon.arrowUp,
            width: 40,
            height: 50,
            color: AppColors.whiteColor,
            strokeWidth: 2,
            loopAnimation: true,
            onTap: onScrollDown ?? () {},
            onHover: (value) {},
          ),
        ),
      ],
    );
  }
}

final List<String> platforms = [
  'LinkedIn',
  'GitHub',
  'ahmed.elabbasy23@gmail.com',
  '+201288278807',
];

final List<IconData> icons = [
  FontAwesomeIcons.linkedin,
  FontAwesomeIcons.github,
  FontAwesomeIcons.envelope,
  FontAwesomeIcons.whatsapp,
];