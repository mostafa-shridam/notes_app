import 'package:flutter/material.dart';
import 'package:notes_app/widgets/build_default_alert.dart';
import 'package:notes_app/widgets/my_text_filed.dart';

class BuildBottomSheet extends StatelessWidget {
  const BuildBottomSheet({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          MyTextFiled(
            helperText: 'Notes Title',
            onChanged: (f) {},
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: MyTextFiled(
              helperText: 'Notes desc',
              onChanged: (f) {},
            ),
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const DefaultAlert(),
              );
            },
            child: const Text('Chose your color'),
          ),
          TextButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
