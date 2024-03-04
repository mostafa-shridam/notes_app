import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/note_cubit/cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/states.dart';
import 'package:notes_app/widgets/build_add_notes.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';

class AddNotesScreen extends StatelessWidget {
  const AddNotesScreen({super.key, this.color});

  final Color? color;
  static String id = 'add';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        listener: (context, state) {
          if (state is AddNotesError) {
            log('error : ${state.error}');
          } else if (state is AddNotesSuccess) {
            Navigator.pop(context);
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            showSnackBar(context, 'Add note success');
          }
        },
        builder: (context, state) {
          return LoadingOverlay(
            isLoading: state is AddNotesLoading ? true : false,
            progressIndicator: progressIndicator,
            child: Scaffold(
              appBar: customBuildAppBar(
                title: 'Add Notes',
                titleSpacing: -6,
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: AbsorbPointer(
                      absorbing: state is AddNotesLoading ? true : false,
                      child: const BuildAddNotes(),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
