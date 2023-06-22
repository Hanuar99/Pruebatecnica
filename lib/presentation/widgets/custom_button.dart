import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color colorButton;
  final String text;
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.colorButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40.h,
      decoration: BoxDecoration(
        color: colorButton,
        borderRadius: BorderRadius.circular(86.r),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(20.0),
        ),
        child: Text(
          text,
          style: AppTextStyle.buttonText,
        ),
      ),
    );
  }
}
