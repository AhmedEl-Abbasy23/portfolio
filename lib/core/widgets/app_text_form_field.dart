import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class AppTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final double borderRadius;
  final double? fieldWidth;
  final TextStyle? hintStyle;
  final String? hintText;
  final TextStyle? labelStyle;
  final TextStyle? inputStyle;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final double? horizontalPadding;
  final TextInputAction? textInputAction;
  final String? Function(String? val)? validator;
  final Function(String s)? onChanged;
  final Function(String?)? onFieldSubmitted;
  final Function()? onTap;
  final bool hasTitle;
  final bool isPassword;
  final bool isTitleBold;
  final bool withBoxShadow;
  final String title;
  final Color? titleColor;
  final TextDirection? textDirection;
  final bool focusKeyboard;
  final TextStyle? titleStyle;
  // final String? initialText;

  final int numberOfLines;
  final bool? readOnly;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.borderRadius = 8,
    this.fieldWidth,
    this.horizontalPadding,
    this.textInputType,
    this.textInputAction,
    this.hintStyle,
    this.hintText,
    this.suffixIcon,
    this.backgroundColor,
    this.borderColor,
    this.controller,
    this.validator,
    this.hasTitle = true,
    this.isPassword = false,
    this.withBoxShadow = false,
    this.focusKeyboard = false,
    this.title = "",
    this.titleColor,
    this.textDirection,
    // this.initialText = "",
    this.numberOfLines = 1,
    this.readOnly = false,
    this.isTitleBold = false,
    this.onTap,
    this.prefixIcon,
    this.prefix,
    this.onFieldSubmitted,
    this.labelStyle,
    this.inputStyle,
    this.labelText,
    this.onChanged,
    this.titleStyle,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.fieldWidth ?? context.width,
      padding: widget.horizontalPadding == null
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(horizontal: widget.horizontalPadding ?? 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.hasTitle
              ? Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    widget.title,
                    style: widget.titleStyle ??
                        (widget.isTitleBold
                            ? AppTextStyles.g500GreyW700S14PxStyle
                                .copyWith(color: widget.titleColor)
                            : AppTextStyles.g500GreyW700S14PxStyle
                                .copyWith(color: widget.titleColor)),
                  ),
                )
              : const SizedBox.shrink(),
          widget.hasTitle ? 4.ph : const SizedBox.shrink(),
          Container(
            decoration: BoxDecoration(
              boxShadow: widget.withBoxShadow
                  ? [
                      BoxShadow(
                        color: AppColors.blackColor.withValues(alpha: 0.1),
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0,
                      )
                    ]
                  : null,
            ),
            child: TextFormField(
              readOnly: widget.readOnly ?? false,
              controller: widget.controller,
              maxLines: widget.numberOfLines,
              // initialValue: widget.initialText,
              textDirection: widget.textDirection,
              keyboardType: widget.textInputType ?? TextInputType.text,
              textInputAction: widget.textInputAction ?? TextInputAction.next,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: widget.contentPadding ??
                    EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                focusedBorder: widget.focusedBorder ??
                    OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.borderColor ??
                            AppColors.primaryColor.withValues(alpha: 0.4),
                        width: 1.5,
                      ),
                      borderRadius:
                          BorderRadius.circular(widget.borderRadius),
                    ),
                enabledBorder: widget.enabledBorder ??
                    OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.borderColor ?? AppColors.t50Color,
                        width: 1.5,
                      ),
                      borderRadius:
                          BorderRadius.circular(widget.borderRadius),
                    ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                labelText: widget.labelText,
                labelStyle: widget.labelStyle ??
                    AppTextStyles.g500GreyW700S14PxStyle
                        .copyWith(color: AppColors.n300Color),
                hintStyle: widget.hintStyle ?? AppTextStyles.g75W500S14PxStyle,
                hintText: widget.hintText,
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(
                            obscureText
                                ? FontAwesomeIcons.solidEye
                                : FontAwesomeIcons.solidEyeSlash,
                            size: 18,
                            color: AppColors.t100Color,
                          ),
                        ),
                      )
                    : widget.suffixIcon,
                prefixIcon: widget.prefixIcon,
                prefix: widget.prefix,
                fillColor: widget.backgroundColor ?? AppColors.whiteColor,
                filled: true,
                alignLabelWithHint: true,
              ),
              obscureText: obscureText,
              style: widget.inputStyle ?? AppTextStyles.g500GreyW700S14PxStyle,
              cursorColor: AppColors.primaryColor,
              textAlignVertical: TextAlignVertical.top,
              onTap: widget.onTap,
              onTapOutside: (event) => widget.focusKeyboard
                  ? null
                  : FocusManager.instance.primaryFocus?.unfocus(),
              onFieldSubmitted: widget.onFieldSubmitted,
              validator: widget.validator,
              onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
