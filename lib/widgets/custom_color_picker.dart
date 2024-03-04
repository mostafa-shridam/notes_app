import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/cubit.dart';
import 'package:notes_app/models/note_model.dart';

class CustomColorPicker extends StatefulWidget {
  const CustomColorPicker({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  State<CustomColorPicker> createState() => _CustomColorPickerState();
}

class _CustomColorPickerState extends State<CustomColorPicker> {
  Color pickerColor = customColor;

  Color currentColor = const Color(0xff443a49);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            BlocProvider.of<AddNotesCubit>(context).color = pickerColor;
            setState(() {});
          },
        ),
      ],
    );
  }
}
