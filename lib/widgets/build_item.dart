import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/edit_notes_screen.dart';
import 'package:notes_app/widgets/view_list_item.dart';

class BuildNoteItem extends StatelessWidget {
  const BuildNoteItem({
    super.key,
    required this.noteModel,
  });

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNotesScreen(
              note: noteModel,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.only(bottom: 24, left: 24, top: 24),
        decoration: BoxDecoration(
          color: Color(noteModel.color),
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        child: ViewListItem(noteModel: noteModel),
      ),
    );
  }
}
