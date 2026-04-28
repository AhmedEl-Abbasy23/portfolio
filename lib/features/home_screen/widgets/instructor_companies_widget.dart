import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';
import 'package:portfolio/features/home_screen/widgets/scroll_widget.dart';

class InstructorCompaniesWidget extends StatelessWidget {
  const InstructorCompaniesWidget({super.key, this.onScrollDown});

  final void Function()? onScrollDown;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: onScrollDown != null
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TAUGHT AT',
              style: AppTextStyles.whiteW400S16PxStyle.copyWith(
                color: AppColors.whiteColor.withValues(alpha: 0.6),
                letterSpacing: 2,
              ),
            ),
            4.ph,
            Text(
              'FLUTTER INSTRUCTOR',
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
                ),
              ],
            ),
          ],
        ),
        if (onScrollDown != null) ...[
          (context.width > 700 ? context.width * 0.2 : context.width * 0.1).pw,
          ScrollWidget(),
        ],
      ],
    );
  }
}
