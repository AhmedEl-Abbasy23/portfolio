import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';
import 'package:portfolio/features/portfolio_screen/widgets/portfolio_view_widget.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key, this.onScrollDown});

  final VoidCallback? onScrollDown;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: PortfolioViewWidget()),
        16.ph,
        FadeInUpBig(
          duration: Duration(seconds: 10),
          child: Text(
            'Scroll down to contact me now'.toUpperCase(),
            textAlign: TextAlign.justify,
            style: AppTextStyles.whiteW400S16PxStyle.copyWith(
              fontSize: 10.fs,
            ),
          ),
        ),
        RiveAnimatedIcon(
          riveIcon: RiveIcon.call,
          width: 40,
          height: 50,
          color: AppColors.whiteColor,
          strokeWidth: 2,
          loopAnimation: true,
          onTap: onScrollDown ?? () {},
          onHover: (value) {},
        ),
      ],
    );
  }
}
