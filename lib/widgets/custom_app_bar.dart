import 'package:flutter/material.dart';

AppBar customBuildAppBar() {
  return AppBar(
    title: const Text('Notes'),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
          child: Container(
            padding: EdgeInsets.zero,
            height: 2,
            width: 46,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.07),
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: const Icon(
              Icons.search_outlined,
              size: 24,
            ),
          ),
        ),
      ),
    ],
  );
}