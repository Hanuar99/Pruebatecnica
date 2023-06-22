import 'package:flutter/material.dart';

Future pushNamed(
    {required BuildContext context,
    // ignore: non_constant_identifier_names
    required String PageConst,
    Object? arg}) async {
  await Navigator.pushNamed(context, PageConst, arguments: arg);
}
