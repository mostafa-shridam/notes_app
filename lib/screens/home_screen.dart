import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/note_cubit/cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/note_cubit/states.dart';
import 'package:notes_app/screens/add_notes_screen.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  static String id = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
        return Scaffold(
          appBar: customBuildAppBar(
            icon: Icons.search_outlined,
            title: 'Notes',
            actions: null,
          ),
          body: const NotesListView(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: customColor,
            onPressed: () {
              Navigator.pushNamed(context, AddNotesScreen.id);
            },
            child: const Icon(
              Icons.add,
            ),
          ),
        );
      },
    );
  }
}
