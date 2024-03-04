import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/note_cubit/cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/my_text_filed.dart';

class EditNotesScreen extends StatefulWidget {
  const EditNotesScreen({
    super.key,
    this.note,
    this.color,
  });

  final Color? color;
  static String id = 'edit';

  final NoteModel? note;

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  String? title;

  String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBuildAppBar(
        actions: IconButton(
          onPressed: () {
            var date = DateTime.now();
            widget.note?.title = (title ?? widget.note?.title)!;
            widget.note?.subTitle = (subTitle ?? widget.note?.subTitle)!;
            widget.note?.date = date.toString();
            widget.note!.save().whenComplete(() {
              Navigator.pop(context);
              showSnackBar(context, 'Edit note success');
            });
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          },
          icon: const Icon(
            Icons.done_outline_rounded,
          ),
        ),
        title: 'Edit notes',
        titleSpacing: -6,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyTextFiled(
                  helperText: 'Notes title',
                  hint: widget.note?.title,
                  onChanged: (value) {
                    title = value;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                MyTextFiled(
                  helperText: 'Content notes',
                  hint: widget.note?.subTitle,
                  onChanged: (value) {
                    subTitle = value;
                  },
                  maxLines: 8,
                  verticalPadding: 12,
                ),
                const SizedBox(
                  height: 30,
                ),
                EditColorsListView(
                  note: widget.note!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
