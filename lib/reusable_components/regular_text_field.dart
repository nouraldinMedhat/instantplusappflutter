import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/text_style_resources.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class RegularTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final String label;
  final bool numberOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color color;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final Function(String?)? onChanged;
  final Color hintColor;
  final Color borderColor;
  final bool secure;
  final bool isPhone;

  const RegularTextField({
    super.key,
    required this.controller,
    required this.inputType,
    required this.label,
    this.validator,
    this.onChanged,
    this.onTap,
    this.secure = false,
    this.numberOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor = ColorsManager.basicBorder,
    this.color = ColorsManager.inputColor,
    this.maxLines = 1,
    this.hintColor = ColorsManager.hintColor,
    this.isPhone = false,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: !readOnly,
      focusNode: readOnly ? AlwaysDisabledFocusNode() : null,
      readOnly: readOnly,
      onTap: onTap,
      obscureText: secure,
      onChanged: onChanged,
      maxLines: maxLines,
      controller: controller,
      textInputAction: TextInputAction.done,
      validator: validator,
      style: getRegularStyle(fontSize: FontSize.kindaSmall),
      cursorColor: ColorsManager.primary,
      keyboardType: inputType,
      inputFormatters: isPhone
          ? [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
              LengthLimitingTextInputFormatter(9),
            ]
          : numberOnly
              ? [FilteringTextInputFormatter.digitsOnly]
              : null,
      decoration: InputDecoration(
        filled: true,
        fillColor: color,
        hintText: label,
        hintStyle: getRegularStyle(
          color: hintColor,
          fontSize: FontSize.kindaSmall,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.primary),
          borderRadius: BorderRadius.circular(12.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.red),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsManager.primary),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}
