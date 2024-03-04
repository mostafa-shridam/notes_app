import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/my_text_filed.dart';

class BuildAddNotes extends StatefulWidget {
  const BuildAddNotes({super.key});

  @override
  State<BuildAddNotes> createState() => _BuildAddNotesState();
}

class _BuildAddNotesState extends State<BuildAddNotes> {
  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  var controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Column(
        children: [
          MyTextFiled(
            helperText: 'Notes title',
            hint: 'Notes title',
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          MyTextFiled(
            helperText: 'Content notes',
            hint: 'Content notes',
            onChanged: (value) {
              subTitle = value;
            },
            maxLines: 8,
            verticalPadding: 12,
          ),
          const SizedBox(
            height: 30,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<AddNotesCubit, AddNotesState>(
            builder: (context, state) {
              return CustomButton(
                color: customColor,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var noteModel = NoteModel(
                      color: customColor.value,
                      title: title!,
                      subTitle: subTitle!,
                      date: DateTime.now().toString(),
                    );
                    BlocProvider.of<AddNotesCubit>(context).color;
                    BlocProvider.of<AddNotesCubit>(context).addNotes(noteModel);
                    controller.animateTo(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );

                    setState(() {});
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'Add',
              );
            },
          ),
        ],
      ),
    );
  }
}
