import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// class ConstVar {
//   static String userId = '';

//   static late GoogleMapController googleMapController;
// }

class AppColors {
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Colors.white;

  static const Color primaryColor = Colors.green;

  static const Color iconsPrimary = Color(0xFF13CACE);
  static const Color iconLoading = Colors.greenAccent;

  static const Color error = Color(0xFFFF1744);
  static const Color background = Color(0xFFF4F6F8);
  static const Color white = Colors.white;
  static const Color azul = Color(0xFF4F99FF);
  static const Color toastSuccess = Colors.green;
  static const Color toastWarning = Colors.yellow;
  static const Color toastError = Colors.red;
}

void flutterToast({
  required String msg,
  required Color backgroundColor,
  required Color textColor,
  Toast? length = Toast.LENGTH_SHORT,
}) {
  Fluttertoast.showToast(
    toastLength: length,
    msg: msg,
    backgroundColor: backgroundColor,
    textColor: textColor,
  );
}

void flutterToastSucces({required String msg}) {
  flutterToast(
      msg: msg,
      backgroundColor: AppColors.toastSuccess,
      textColor: AppColors.white);
}

void flutterToastError({required String msg}) {
  flutterToast(
    msg: msg,
    backgroundColor: AppColors.toastError,
    textColor: AppColors.white,
  );
}
