import 'package:flutter/material.dart';

class QuizHeader extends StatelessWidget {
  final int current;
  final int total;

  const QuizHeader({super.key, required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    final progress = current / total;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Progress Kuis',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('$current / $total'),
          ],
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 9,
            backgroundColor: Colors.grey.shade300,
            color: const Color(0xFF6558D3),
          ),
        ),
      ],
    );
  }
}
