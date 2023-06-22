import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prueba/presentation/bloc/users_bloc.dart';
import 'package:prueba/presentation/widgets/custom_button.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/app_text_style.dart';

void showDeleteConfirmation(BuildContext context, String idUser) {
  if (Platform.isAndroid) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            content: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              width: 283.w,
              height: 175.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Icon(
                        Icons.warning,
                        color: AppColors.primaryColor,
                        size: 48.sp,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text('Desea eliminar el usuario?',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.subtitleText),
                    SizedBox(height: 22.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                            colorButton: Colors.amber,
                            onPressed: () {
                              Navigator.pop(context);
                              BlocProvider.of<UsersBloc>(context)
                                  .add(DeleteUsersEvent(idUser));
                            },
                            text: 'Eliminar'),
                        CustomButton(
                            colorButton: Colors.redAccent,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            text: "Cancelar"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
