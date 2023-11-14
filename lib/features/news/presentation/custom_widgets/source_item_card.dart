import 'package:flutter/material.dart';

class SourceCard extends StatelessWidget {
  const SourceCard({super.key, required this.source});

  final String source;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(5),
        color: Colors.blue.shade50,
        child: Text(
          source,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
      ),
    );
  }
}
