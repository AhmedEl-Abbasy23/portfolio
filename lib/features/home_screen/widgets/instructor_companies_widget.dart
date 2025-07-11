import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class InstructorCompaniesWidget extends StatelessWidget {
  const InstructorCompaniesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Flutter Instructor'.toUpperCase(),
          textAlign: TextAlign.justify,
          style: AppTextStyles.whiteW400S16PxStyle,
        ),
        8.ph,
        Row(
          spacing: 16,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.whiteColor,
              ),
              child: Assets.images.gdscLogo.image(
                height: 40,
                fit: BoxFit.fitHeight,
                // width: 200,
              ),
            ),
            VerticalWhiteDivider(
              height: 40,
            ),
            Assets.images.apexLogo.image(
              height: 30,
            )
          ],
        ),
      ],
    );
  }
}
