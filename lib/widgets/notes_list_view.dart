import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/note_cubit/cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/note_cubit/states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/add_notes_screen.dart';
import 'package:notes_app/widgets/build_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({
    super.key,
  });

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  var controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        return notes.isEmpty
            ? Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'No notes yet',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AddNotesScreen.id);
                      },
                      child: const Text(
                        'Add some!',
                        style: TextStyle(
                          color: customColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  right: 16,
                  left: 16,
                  bottom: 36,
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.builder(
                    reverse: false,
                    controller: controller,
                    physics: const BouncingScrollPhysics(),
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return BuildNoteItem(
                        noteModel: notes.reversed.toList()[index],
                      );
                    },
                  ),
                ),
              );
      },
    );
  }
}
