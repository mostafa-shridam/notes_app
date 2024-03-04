import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

const customColor = Color(0xff6ac2f1);
const kNotesBox = 'notes_box';
Widget progressIndicator = LoadingAnimationWidget.beat(
  color: customColor,
  size: 40,
);

void showSnackBar(
  BuildContext context,
  String text,
) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black.withOpacity(0.8),
      elevation: 10,
      showCloseIcon: true,
      closeIconColor: customColor,
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}

List<Color> kColors = [
  customColor,
  const Color(0xff89CFF0),
  const Color(0xff265073),
  const Color(0xff2D9596),
  const Color(0xff9AD0C2),
  const Color(0xff85B09A),
  const Color(0xff86A789),
  const Color(0xffB2C8BA),
  const Color(0xffD2E3C8),
  const Color(0xffEBF3E8),
  const Color(0xffCCCCFF),
  const Color(0xffB5C0D0),
  const Color(0xffCCD3CA),
  const Color(0xffF5E8DD),
  const Color(0xffF1FADA),
  const Color(0xffEED3D9),
  const Color(0xffF1EAFF),
  const Color(0xffE5D4FF),
  const Color(0xffDCBFFF),
  const Color(0xffD0A2F7),
  const Color(0xffAA7ACD),
  const Color(0xffC671C5),
  const Color(0xff843B87),
  const Color(0xff93D185),
  const Color(0xff538547),
  const Color(0xff706233),
  const Color(0xffB0926A),
  const Color(0xffE1C78F),
  const Color(0xffFAE7C9),
];
