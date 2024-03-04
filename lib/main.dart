import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/bloc_observer/bloc_observer.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/note_cubit/cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/add_notes_screen.dart';
import 'package:notes_app/screens/edit_notes_screen.dart';
import 'package:notes_app/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = MyBlocObserver();

  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
          ),
        ),
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => const HomeScreen(),
          AddNotesScreen.id: (context) => const AddNotesScreen(),
          EditNotesScreen.id: (context) => const EditNotesScreen(),
        },
      ),
    );
  }
}
