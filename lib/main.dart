import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/screens/home_screen.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarDividerColor: Colors.transparent
        )
        ),
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
      },
    );
  }
}
