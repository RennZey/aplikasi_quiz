import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import 'review_screen.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quiz, child) {
        final percentage = (quiz.score / quiz.totalQuestions * 100).round();

        String message;

        if (percentage >= 80) {
          message = 'Luar biasa! Kamu hebat!';
        } else if (percentage >= 60) {
          message = 'Bagus! Terus tingkatkan!';
        } else {
          message = 'Jangan menyerah, coba lagi!';
        }

        return Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.emoji_events_rounded,
                        size: 110,
                        color: Color(0xFFFFB800),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Kuis Selesai!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Selamat, ${quiz.userName}!',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6558D3),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'SKOR AKHIR',
                              style: TextStyle(color: Colors.white70),
                            ),
                            Text(
                              '$percentage',
                              style: const TextStyle(
                                fontSize: 65,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              'dari 100',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
                            child: _scoreCard(
                              'Benar',
                              quiz.score,
                              Colors.green,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _scoreCard(
                              'Salah',
                              quiz.wrongAnswers,
                              Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        message,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6558D3),
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ReviewScreen(),
                              ),
                            );
                          },
                          child: const Text('Review Jawaban'),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            quiz.resetQuiz();

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomeScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: const Text('Ulangi Kuis'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _scoreCard(String title, int value, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(
            '$value',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}
