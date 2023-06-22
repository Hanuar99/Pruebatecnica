import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/constants.dart';
import '../../core/utils/app_text_style.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? hinText;
  final TextStyle? labelStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmit;
  final bool obscureText = false;
  final int? maxLine = 1;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool readOnly;
  final VoidCallback? onTap;
  const CustomTextFormField(
      {super.key,
      this.controller,
      this.keyboardType,
      this.labelText,
      this.hinText,
      this.labelStyle,
      this.suffixIcon,
      this.prefixIcon,
      this.onChanged,
      this.validator,
      this.onSubmit,
      this.maxLength,
      this.focusNode,
      this.onTap,
      this.readOnly = false});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  double radius = 12.r;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      focusNode: widget.focusNode,
      readOnly: widget.readOnly,
      maxLength: widget.maxLength,
      maxLines: widget.maxLine,
      controller: widget.controller,
      style: AppTextStyle.labelTextFormField,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 18.w),
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        hintText: widget.hinText,
        hintStyle: const TextStyle(color: Color(0xFFB0B3BA)),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        prefixIconColor: AppColors.iconsPrimary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        errorMaxLines: 2,
      ),
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      validator: widget.validator,
      onFieldSubmitted: widget.onSubmit,
    );
  }
}
