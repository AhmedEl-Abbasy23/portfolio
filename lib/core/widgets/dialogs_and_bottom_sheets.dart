import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class DialogAndBottomSheets {
  DialogAndBottomSheets._();

  static previewScaffoldMessenger({
    required BuildContext context,
    required String text,
  }) {
    return ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            text,
            style: TextStyle(fontSize: 18.fs, color: AppColors.whiteColor),
          ),
          duration: const Duration(seconds: 4),
          // backgroundColor: AppColors.greyColor,
        ),
      );
  }

  static showInfoDialog(
    BuildContext context, {
    required String icon,
    String? buttonText,
    bool barrierDismissible = false,
    String? title,
    required String content,
    required void Function() onPressed,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: AppColors.blackColor.withValues(alpha: 0.5),
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 44),
          child: AlertDialog(
            backgroundColor: AppColors.whiteColor,
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null) 16.ph,
                if (title != null)
                  Text(
                    title,
                    style: AppTextStyles.g500GreyW700S14PxStyle,
                  ),
                16.ph,
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.g500GreyW700S14PxStyle,
                ),
              ],
            ),
            actionsPadding: EdgeInsets.only(
                top: 8, bottom: 24, right: 24, left: 24),
            contentPadding:
                EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            buttonPadding: EdgeInsets.zero,
            actions: [
              AppButton(
                height: 50,
                buttonText: buttonText ?? 'okay',
                textStyle: AppTextStyles.g500GreyW700S14PxStyle,
                borderRadius: 12,
                onPressed: onPressed,
              ),
            ],
          ),
        );
      },
    );
  }

  static previewBottomSheet<T>({
    required BuildContext context,
    required Widget buildWidget,
  }) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      isScrollControlled: true,
      builder: (ctx) {
        return buildWidget;
      },
    );
  }
}
