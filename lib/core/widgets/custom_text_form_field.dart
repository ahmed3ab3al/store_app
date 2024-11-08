import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final TextInputType? type;
  final double? borderRadius;
  final Widget? prefixIcon;
  final String? hint;
  final String? label;
  final TextEditingController? customController;
  final bool? secure;
  final Widget? suffixIcon;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final TextStyle? inputTextStyle;
  final Color? borderColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? cursorColor;

  const CustomTextFormFiled({
    super.key,
    this.hint,
    required this.customController,
    this.type,
    this.prefixIcon,
    this.suffixIcon,
    this.secure = false,
    this.hintTextStyle,
    this.label,
    this.labelTextStyle,
    this.borderRadius,
    this.inputTextStyle,
    this.borderColor,
    this.cursorColor, this.enabledBorderColor, this.focusedBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: inputTextStyle,
      cursorColor: cursorColor,
      controller: customController,
      keyboardType: type,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(
              color: focusedBorderColor!,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(
              color: enabledBorderColor!,
            ),
          ),
          hintText: hint,
          hintStyle: hintTextStyle,
          labelStyle: labelTextStyle,
          labelText: label,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon),
    );
  }
}