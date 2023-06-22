import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba/core/constants/constants.dart';
import 'package:prueba/core/utils/app_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? widgetActions;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.widgetActions,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(20.r),
              bottomStart: Radius.circular(20.r))),
      title: Text(title, style: AppTextStyle.appbarPrincipal),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(20.r),
              bottomStart: Radius.circular(20.r)),
        ),
      ),
      actions: widgetActions,
    );
  }
}
