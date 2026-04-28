import 'package:flutter/material.dart';

import '../../../exports.dart';

class SkillsChipsWidget extends StatelessWidget {
  const SkillsChipsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      'Flutter',
      'Dart',
      'BLoC',
      'Firebase',
      'REST APIs',
      'Payments',
      'Chat',
      'Maps',
      'Performance',
      'Clean Architecture',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 8,
        runSpacing: 12,
        children: skills.map((skill) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ).copyWith(top: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: AppColors.primaryColor.withValues(alpha: 0.8),
                width: 1.5,
              ),
            ),
            child: Text(
              skill,
              style: AppTextStyles.whiteW500S19PxStyle.copyWith(
                fontSize: 14.fs,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
