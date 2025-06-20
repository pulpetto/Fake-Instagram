import 'package:flutter/material.dart';

class BioBox extends StatelessWidget {
  final String bio;

  const BioBox({super.key, required this.bio});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
      ),
      width: double.infinity,
      child: Text(
        bio.isNotEmpty ? bio : 'Empty bio...',
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
