import 'package:flutter/material.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.only(bottom: 24, left: 24, top: 24),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(
                0.4,
              ),
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: const Text(
                    'Flutter',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Padding(
                    padding: EdgeInsets.only(top:  12.0),
                    child: Text(
                      'datasaddaiflsjksfjlkdsnlkndljdkfsaaaaaaaaaaaaaaaaaaaaaaasadrereayhfknibjnfvindsnjnkjnkjsaniu',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    splashRadius: 24,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_outline,
                      size: 28,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 12,
                    right: 24.0,
                  ),
                  child: Text('12/2/2'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}