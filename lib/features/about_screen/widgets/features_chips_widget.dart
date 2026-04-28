import 'package:flutter/material.dart';

import '../../../exports.dart';

class FeaturesChipsWidget extends StatelessWidget {
  const FeaturesChipsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      'Voice & Video Calls',
      'Real-time Chat',
      'Push Notifications',
      'Maps & Tracking',
      'Dashboards',
      'Scalable Architecture',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'FEATURES I BUILD',
            style: AppTextStyles.whiteW400S16PxStyle.copyWith(
              color: AppColors.whiteColor.withValues(alpha: 0.6),
              letterSpacing: 2,
            ),
          ),
          12.ph,
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 12,
            children: features.map((feature) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ).copyWith(top: 4),
                decoration: BoxDecoration(
                  color: Colors.lightBlue.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.lightBlue.withValues(alpha: 0.7),
                    width: 1.5,
                  ),
                ),
                child: Text(
                  feature,
                  style: AppTextStyles.whiteW400S16PxStyle.copyWith(
                    fontSize: 15.fs,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}