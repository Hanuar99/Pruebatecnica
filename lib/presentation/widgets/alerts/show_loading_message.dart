import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/presentation/bloc/users_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/app_text_style.dart';

void showLoadingMessage(BuildContext context, String message) {
  if (Platform.isAndroid) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => BlocListener<UsersBloc, UsersState>(
        listener: (context, state) {
          print(state);
          if (state.registerUserStatus == RegisterUserStatus.loadSuccess) {
            Navigator.pop(context);
          }

          if (state.deleteUserStatus == DeleteUserStatus.loadSuccess) {
            Navigator.pop(context);
          }

          if (state.editUserStatus == EditUserStatus.loadSuccess) {
            Navigator.pop(context);
          }
        },
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            width: 300,
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 61),
                  child: SizedBox(
                    width: 46,
                    height: 46,
                    child: CircularProgressIndicator(
                      strokeWidth: 6,
                      color: AppColors.iconLoading,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(message, style: AppTextStyle.subtitleText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  } else {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CupertinoAlertDialog(
        content: Column(
          children: [
            const SizedBox(height: 16),
            const CupertinoActivityIndicator(),
            const SizedBox(height: 16),
            Text(
              message,
              style: AppTextStyle.subtitleText,
            ),
          ],
        ),
      ),
    );
  }
}
