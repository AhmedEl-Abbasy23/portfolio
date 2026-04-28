import 'package:flutter/material.dart';

import '../../../exports.dart';

class PortfolioWaitingWidget extends StatelessWidget {
  const PortfolioWaitingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.lottie.developer.lottie(
          height: 300,
          fit: BoxFit.fitHeight,
        ),
        Text(
          'REAL PRODUCTS. REAL RESULTS.',
          textAlign: TextAlign.center,
          style: AppTextStyles.whiteW400S32PxStyle.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        12.ph,
        TypingText(
          text: 'Apps built for businesses, users, and growth'
              .toUpperCase(),
          style: AppTextStyles.whiteW400S18PxStyle.copyWith(
            fontSize: 20.5.fs,
            color: Colors.lightBlue,
          ),
          milliseconds: 40,
        ),
      ],
    );
  }
}
