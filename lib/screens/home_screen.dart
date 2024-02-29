import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBuildAppBar(),
      body: const NotesListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) =>const Column());
        },
        child: const Icon(Icons.add,),
      ),
    );
  }
}
