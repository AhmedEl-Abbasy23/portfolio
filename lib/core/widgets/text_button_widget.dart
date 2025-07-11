import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.textStyle,
    this.textAlign,
  });

  final String text;
  final void Function() onTap;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: textStyle ?? AppTextStyles.g500GreyW700S14PxStyle,
        textAlign: textAlign ?? TextAlign.start,
      ),
    );
  }
}
