import 'package:flutter/material.dart';

Future pushNamed(
    {required BuildContext context,
    required String PageConst,
    Object? arg}) async {
  await Navigator.pushNamed(context, PageConst, arguments: arg);
}
