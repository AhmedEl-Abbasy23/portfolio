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
          '+3 Years in Mobile Apps Development'.toUpperCase(),
          textAlign: TextAlign.justify,
          style: AppTextStyles.whiteW400S18PxStyle,
        ),
        8.ph,
        Row(
          spacing: 16,
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
          ],
        ),
      ],
    );
  }
}
