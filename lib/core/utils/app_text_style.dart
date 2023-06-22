import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

class AppTextStyle with Diagnosticable {
  static TextStyle? appbarPrincipal = TextStyle(
    fontSize: 23.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle? labelTextFormField = TextStyle(
    fontSize: 16.sp,
    color: AppColors.textPrimary,
  );
  static TextStyle? subtitleText = TextStyle(
    fontSize: 19.sp,
    color: AppColors.textPrimary,
  );
  static TextStyle? buttonText = TextStyle(
    fontSize: 19.sp,
    color: AppColors.textSecondary,
  );
}
