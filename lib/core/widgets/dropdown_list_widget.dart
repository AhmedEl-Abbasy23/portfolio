import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class DropdownListWidget extends StatefulWidget {
  const DropdownListWidget({
    super.key,
    required this.currentValue,
    required this.listValues,
    this.dropdownTitle,
    this.dropdownTitleStyle,
    this.borderColor,
    this.prefixIcon,
    this.backgroundColor = AppColors.whiteColor,
    this.width,
    this.dropDownVerticalPadding,
    this.onTap,
    this.onCancelTap,
    this.isEditInfo = false,
    this.validator,
  });

  final String currentValue;
  final List<String> listValues;
  final String? dropdownTitle;
  final String? prefixIcon;
  final TextStyle? dropdownTitleStyle;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? width;
  final double? dropDownVerticalPadding;
  final void Function(String?)? onTap;
  final void Function()? onCancelTap;
  final String? Function(String?)? validator;
  final bool isEditInfo;

  @override
  State<DropdownListWidget> createState() => _DropdownListWidgetState();
}

class _DropdownListWidgetState extends State<DropdownListWidget> {
  String selectedValue = "";
  bool showDropdown = false;
  List<String> values = [];

  @override
  void initState() {
    super.initState();
    selectedValue = widget.currentValue;
    values = widget.listValues;
    if (widget.prefixIcon != null) {
      values.insert(0, selectedValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: widget.dropdownTitle != null,
          child: Text(
            widget.dropdownTitle ?? '',
            style:
                widget.dropdownTitleStyle ?? AppTextStyles.g500W500S14PxStyle,
          ),
        ),
        Visibility(
          visible: widget.dropdownTitle != null,
          child: 4.ph,
        ),
        SizedBox(
          width: widget.width ?? context.width,
          child: DropdownButtonFormField2<String>(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal:
                    StorageHelper.getLanguagePrefs() == 'en' ? 4 : 8,
                vertical: widget.dropDownVerticalPadding ?? 8,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: widget.borderColor ?? AppColors.t50Color,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor ??
                      AppColors.primaryColor.withValues(alpha: 0.4),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? AppColors.t50Color,
                    width: 1.5,
                  )),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: widget.backgroundColor,
              // Add more decoration..
            ),
            hint: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // TODO.
                /*Visibility(
                  visible: widget.prefixIcon != null,
                  child: ImageIconWidget(
                    icon: widget.prefixIcon ?? '',
                    iconType: ImageIconType.svg,
                    height: 20.h,
                    width: 20.w,
                  ),
                ),*/
                Visibility(
                  visible: widget.prefixIcon != null,
                  child: 8.pw,
                ),
                !widget.isEditInfo
                    ? Text(
                        widget.currentValue,
                        style: AppTextStyles.blackW700S14PxStyle.copyWith(
                          fontSize: StorageHelper.getLanguagePrefs() == 'en'
                              ? 13
                              : null,
                        ),
                      )
                    : Text(
                        widget.currentValue,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyles.blackW700S14PxStyle.copyWith(
                          fontSize: StorageHelper.getLanguagePrefs() == 'en'
                              ? 13
                              : null,
                        ),
                      ),
              ],
            ),
            items: values
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // TODO.
                        /*Visibility(
                          visible: widget.prefixIcon != null,
                          child: ImageIconWidget(
                            icon: widget.prefixIcon ?? '',
                            iconType: ImageIconType.svg,
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),*/
                        Visibility(
                          visible: widget.prefixIcon != null,
                          child: 8.pw,
                        ),
                        !widget.isEditInfo
                            ? Text(
                                item,
                                style: AppTextStyles.g300W700S14PxStyle,
                              )
                            : SizedBox(
                                width:
                                    (widget.width ?? context.width) *
                                        0.75,
                                child: Text(
                                  item,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.g300W700S14PxStyle,
                                ),
                              ),
                      ],
                    ),
                    /* Text(
                      item,
                      style: AppTextStyles.blackW400S14PxStyle.copyWith(
                        fontSize: StorageHelper.getLanguagePrefs() == 'en'
                            ? 13.sp
                            : null,
                      ),
                    ),*/
                  ),
                )
                .toList(),
            validator: widget.validator != null
                ? (String? value) => widget.validator!(value)
                : null,
            onChanged: (value) {
              // Select city id is required.
              if (widget.prefixIcon == null) {
                if (widget.onTap != null) {
                  widget.onTap!(value);
                }
              } else {
                // Select city id isn't required.
                // Any index -> for rest filter
                if (value.toString() != values.first) {
                  widget.onTap!(value);
                } else {
                  // index 0 -> for rest filter
                  if (widget.onCancelTap != null) {
                    widget.onCancelTap!();
                  }
                }
              }
            },
            onSaved: (value) {
              selectedValue = value.toString();
            },
            buttonStyleData: ButtonStyleData(
              padding: EdgeInsetsDirectional.only(end: 6),
            ),
            // TODO.
            /*iconStyleData: IconStyleData(
              icon: ImageIconWidget(
                icon: Assets.iconsArrowDown,
                iconType: ImageIconType.svg,
                height: 10.h,
              ),
              iconSize: 22.dg,
            ),*/
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 8),
            ),
          ),
        ),
      ],
    );
  }
}
