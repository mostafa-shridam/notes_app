import 'package:flutter/material.dart';
import 'package:notes_app/widgets/build_bottom_sheet.dart';

Future<dynamic> buildShowModalBottomSheet(
  BuildContext context,
) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return const BuildBottomSheet(
        color: Colors.cyan,
      );
    },
    elevation: 0,
    enableDrag: true,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        16,
      ),
    ),
  );
}
