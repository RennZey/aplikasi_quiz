import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quiz, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Review Jawaban'),
            centerTitle: true,
          ),
          body: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: quiz.totalQuestions,
            itemBuilder: (context, index) {
              final question = quiz.questions[index];
              final selected = quiz.answers[index];
              final correct = question.correctAnswer;

              final isCorrect = selected == correct;

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pertanyaan ${index + 1}',
                        style: const TextStyle(
                          color: Color(0xFF6558D3),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        question.question,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Jawaban kamu: ${selected == null ? "Belum dijawab" : question.options[selected]}',
                        style: TextStyle(
                          color: isCorrect ? Colors.green : Colors.red,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Jawaban benar: ${question.options[correct]}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            isCorrect ? Icons.check_circle : Icons.cancel,
                            color: isCorrect ? Colors.green : Colors.red,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            isCorrect ? 'Benar' : 'Salah',
                            style: TextStyle(
                              color: isCorrect ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
