import 'package:flutter/material.dart';

AppBar customBuildAppBar({
  IconData? icon,
  required String title,
  double? titleSpacing,
  Widget? actions,
}) {
  return AppBar(
    titleSpacing: titleSpacing,
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
    actions: [
      actions ?? const SizedBox(),
    ],
  );
}
