import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/note_cubit/states.dart';
import 'package:notes_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesStates> {
  static NotesCubit get(context) => BlocProvider.of(context);

  NotesCubit() : super(NotesInitial());

  NoteModel? noteModel;
  List<NoteModel>? notes;

  fetchAllNotes() {
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      notes = notesBox.values.toList();
      notes?.last;
      emit(NotesSuccess());
    } catch (e) {
      emit(NotesError());
    }
  }
}
