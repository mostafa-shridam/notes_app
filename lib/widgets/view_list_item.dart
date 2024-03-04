import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/note_cubit/cubit.dart';
import 'package:notes_app/models/note_model.dart';

class ViewListItem extends StatelessWidget {
  const ViewListItem({
    super.key,
    required this.noteModel,
  });

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ListTile(
          title: Text(
            noteModel.title,
            style: TextStyle(
              fontSize: 22,
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              noteModel.subTitle,
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          trailing: IconButton(
            splashRadius: 24,
            onPressed: () {
              noteModel.delete();
              NotesCubit.get(context).fetchAllNotes();
              showSnackBar(context, 'Delete note success');
            },
            icon: Icon(
              Icons.delete_outline,
              color: Colors.black.withOpacity(0.8),
              size: 28,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 12,
            right: 24.0,
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Text(
              formatDate(
                DateTime.parse(noteModel.date),
                [yyyy, '-', mm, '-', dd, '   ', hh, ':', nn, '  ', am],
              ),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
