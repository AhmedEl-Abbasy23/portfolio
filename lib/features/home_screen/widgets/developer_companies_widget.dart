import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class DeveloperCompaniesWidget extends StatelessWidget {
  const DeveloperCompaniesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'WORKED WITH',
          style: AppTextStyles.whiteW400S16PxStyle.copyWith(
            color: AppColors.whiteColor.withValues(alpha: 0.6),
            letterSpacing: 2,
          ),
        ),
        4.ph,
        RichText(
          text: TextSpan(
            style: AppTextStyles.whiteW400S18PxStyle,
            children: [
              TextSpan(
                text: '+4 ',
                style: AppTextStyles.blueW500S26PxStyle.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 20.fs,
                ),
              ),
              TextSpan(
                text: 'YEARS IN SOFTWARE DEVELOPMENT',
                style: AppTextStyles.whiteW400S18PxStyle,
              ),
            ],
          ),
        ),
        8.ph,
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            Assets.images.magdsoftLogo.image(
              height: 30,
              width: 100,
            ),
            VerticalWhiteDivider(),
            Assets.images.accuraLogo.image(
              height: 30,
              width: 100,
            ),
            VerticalWhiteDivider(),
            Assets.images.elryadLogo.image(
              height: 30,
              width: 80,
              fit: BoxFit.fitWidth,
            ),
            VerticalWhiteDivider(),
            Assets.images.neopLogo.image(height: 24, width: 50),
            VerticalWhiteDivider(),
            Assets.images.bsnsWheelLogo.image(height: 24, width: 90),
          ],
        ),
      ],
    );
  }
}
