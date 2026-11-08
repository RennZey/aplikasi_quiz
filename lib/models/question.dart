class Question {
  final String question;
  final List<String> options;
  final int correctAnswer;

  const Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

const List<Question> quizQuestions = [
  Question(
    question: 'Apa kepanjangan dari CPU?',
    options: [
      'Central Processing Unit',
      'Computer Personal Unit',
      'Central Program Utility',
      'Control Processing User',
    ],
    correctAnswer: 0,
  ),
  Question(
    question: 'Bahasa pemrograman yang digunakan Flutter adalah?',
    options: ['Java', 'Python', 'Dart', 'C++'],
    correctAnswer: 2,
  ),
  Question(
    question: 'Apa fungsi RAM pada komputer?',
    options: [
      'Menyimpan data permanen',
      'Menyimpan data sementara',
      'Menampilkan gambar',
      'Menghubungkan internet',
    ],
    correctAnswer: 1,
  ),
  Question(
    question: 'Manakah yang termasuk sistem operasi?',
    options: ['Microsoft Word', 'Google Chrome', 'Windows', 'Adobe Photoshop'],
    correctAnswer: 2,
  ),
  Question(
    question: 'Apa kepanjangan dari HTML?',
    options: [
      'HyperText Markup Language',
      'HighText Machine Language',
      'Hyper Transfer Main Link',
      'Home Tool Markup Language',
    ],
    correctAnswer: 0,
  ),
];
