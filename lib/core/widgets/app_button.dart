import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class AppButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? width;
  final double? height;
  final String buttonText;
  final String? buttonIcon;
  final Color? buttonIconColor;
  final bool buttonIconStart;
  final bool isActive;
  final Color? splashColor;
  final Color? borderColor;
  final double? buttonIconHeight;
  final double? buttonIconWidth;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final double? fontSize;

  const AppButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.height,
    this.width,
    required this.buttonText,
    this.buttonIcon,
    this.buttonIconColor,
    this.splashColor,
    this.buttonIconHeight,
    this.buttonIconWidth,
    this.textStyle,
    this.fontSize,
    this.buttonIconStart = false,
    this.isActive = true,
    required this.onPressed,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isActive ? onPressed : () {},
      style: ButtonStyle(
          fixedSize: WidgetStateProperty.all(
            Size(width ?? double.maxFinite, height ?? 60),
          ),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.hovered)) {
              return AppColors.primaryColor;
            }
            return isActive
                ? backgroundColor ?? AppColors.primaryColor
                : AppColors.primaryColor.withValues(alpha: 0.4);
          }),
          foregroundColor: WidgetStateProperty.all(
            splashColor ?? AppColors.whiteColor.withValues(alpha: 0.2),
          ),
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 16,
              vertical: verticalPadding ?? 0,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 4),
              side: BorderSide(
                color: borderColor ?? AppColors.primaryColor.withValues(alpha: 0.5),
              ),
            ),
          ),
          alignment: Alignment.center,
      ),
      child: buttonIcon == null
          ? Padding(
            padding: EdgeInsetsDirectional.only(top: Sizes.isLargeDesktop(context) ? 4 : 6),
            child: Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: textStyle ??
              AppTextStyles.btnTextStyle.copyWith(fontSize: fontSize),
                  ),
          )
          : Padding(
        padding: EdgeInsetsDirectional.only(top: Sizes.isLargeDesktop(context) ? 4 : 6),
            child: Row(
                    children: [
            Text(
              buttonText,
              textAlign: TextAlign.center,
              style: textStyle ??
                  AppTextStyles.btnTextStyle.copyWith(fontSize: fontSize),
            ),
            // TODO. Add icon
                    ],
                  ),
          ),
    );
  }
}

class AppLoadingButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? width;
  final double? height;

  const AppLoadingButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? AppColors.primaryColor,
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 32,
            vertical: verticalPadding ?? 14,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(width ?? double.maxFinite, height ?? 60),
        ),
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (states) {
            if (states.contains(WidgetState.pressed)) {
              return backgroundColor ??
                  AppColors.secondaryColor.withValues(
                      alpha:
                      0.7); // Change to desired splash color or keep transparent
            }
            return null; // Use default overlay color
          },
        ),
      ),
      onPressed: () {},
      child: SizedBox(
          width: 20,
          height: 20,
          child: const CircularProgressIndicator(color: Colors.white)),
    );
  }
}
