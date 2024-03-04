import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/note_model.dart';

class DefaultAlert extends StatefulWidget {
  const DefaultAlert({
    super.key,
    this.note,
  });

  final NoteModel? note;

  @override
  State<DefaultAlert> createState() => _DefaultAlertState();
}

class _DefaultAlertState extends State<DefaultAlert> {
  Color pickerColor = customColor;

  Color currentColor = const Color(0xff443a49);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      content: Column(
        children: [
          SizedBox(
            height: 460,
            child: ColorPicker(
              hexInputBar: false,
              displayThumbColor: true,
              enableAlpha: true,
              pickerAreaBorderRadius: BorderRadius.circular(
                12,
              ),
              portraitOnly: false,
              pickerColor: pickerColor,
              onColorChanged: (color) {
                changeColor(color);
              },
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                pickerColor,
              ),
            ),
            child: Text(pickerColor.toString()),
            onPressed: () {
              currentColor = pickerColor;

              Navigator.of(context).pop();
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
