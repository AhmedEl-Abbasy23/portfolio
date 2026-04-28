import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class BackWidget extends StatelessWidget {
  final VoidCallback? onBack;
  final Color? color;
  final IconData? icon;
  final double? size;

  const BackWidget({
    super.key,
    this.onBack,
    this.color,
    this.icon,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsetsDirectional.only(top: 4, start: 24),
      onPressed: () {
        if (onBack != null) {
          onBack?.call();
        } else {
          Navigator.pop(context);
        }
      },
      icon: Icon(
        // icon ?? CupertinoIcons.chevron_back,
        Icons.arrow_back_ios,
        color: color ?? AppColors.whiteColor,
        size: size ?? 28,
      ),
    );
  }
}
