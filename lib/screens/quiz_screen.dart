import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../widgets/quiz_header.dart';
import '../widgets/answer_option.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quiz, child) {
        final question = quiz.questions[quiz.currentQuestion];

        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Kuis Pengetahuan'),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Padding(
                        padding: EdgeInsets.all(constraints.maxWidth * 0.045),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            QuizHeader(
                              current: quiz.currentQuestion + 1,
                              total: quiz.totalQuestions,
                            ),
                            const SizedBox(height: 25),
                            Text(
                              'Halo, ${quiz.userName}!',
                              style: const TextStyle(
                                color: Color(0xFF6558D3),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Pertanyaan ${quiz.currentQuestion + 1}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              question.question,
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 25),
                            Expanded(
                              child: ListView.separated(
                                itemCount: question.options.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 12),
                                itemBuilder: (context, index) {
                                  return AnswerOption(
                                    answer: question.options[index],
                                    label: String.fromCharCode(65 + index),
                                    isSelected: quiz.selectedAnswer == index,
                                    onTap: () {
                                      quiz.selectAnswer(index);
                                    },
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: quiz.selectedAnswer == null
                                    ? null
                                    : () {
                                        if (quiz.isLastQuestion) {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  const ResultScreen(),
                                            ),
                                          );
                                        } else {
                                          quiz.nextQuestion();
                                        }
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF6558D3),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                ),
                                child: Text(
                                  quiz.isLastQuestion
                                      ? 'Lihat Hasil'
                                      : 'Pertanyaan Berikutnya',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
