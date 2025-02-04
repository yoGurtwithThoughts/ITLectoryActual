import 'package:flutter/material.dart';
import 'package:it_lectory_3/core/test-infomation-data.dart';
import 'package:it_lectory_3/pages/students/students_profile.dart';
import 'package:it_lectory_3/widgets/style_text.dart';
import 'package:it_lectory_3/widgets/test-button.dart';

class TestDetailPage extends StatefulWidget {
  final String title;
  final List<Test> tests;
  final bool isBack;

  const TestDetailPage({
    super.key,
    required this.title,
    required this.tests,
    this.isBack = true,
  });

  @override
  _TestDetailPageState createState() => _TestDetailPageState();
}

class _TestDetailPageState extends State<TestDetailPage> {
  List<int?> selectedAnswers = [];
  List<bool> isAnswered =
      []; // Список для отслеживания, был ли уже ответ на вопрос

  @override
  void initState() {
    super.initState();
    selectedAnswers = List.generate(widget.tests.length, (_) => null);
    isAnswered = List.generate(
        widget.tests.length, (_) => false); // Инициализируем с false
  }

  void _showResultDialog(BuildContext context) {
    int correctAnswers = 0;
    for (int i = 0; i < widget.tests.length; i++) {
      if (selectedAnswers[i] == widget.tests[i].correctAnswerIndex) {
        correctAnswers++;
      }
    }

    double progress = correctAnswers / widget.tests.length;

    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 250,
              width: 250,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromRGBO(45, 45, 45, 0.65),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Результат: ${correctAnswers}/${widget.tests.length}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomPaint(
                    size: Size(75, 75),
                    painter: ProgressPainter(progress: progress),
                  ),
                  SizedBox(height: 35),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.close,
                      size: 35,
                      color: Colors.white.withOpacity(0.65),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.title,
          style: TextStylesMain.title,
        ),
        leading: widget.isBack
            ? InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromRGBO(0, 85, 150, 1),
                ),
              )
            : const SizedBox(width: 24),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.tests.length,
              itemBuilder: (context, index) {
                final test = widget.tests[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.transparent),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(test.question, style: TextStylesMain.themetxt),
                        SizedBox(height: 10),
                        Column(
                          children: test.answers.asMap().entries.map((entry) {
                            int answerIndex = entry.key;
                            String answer = entry.value;

                            return AnswerButton(
                              answer: answer,
                              isSelected: selectedAnswers[index] == answerIndex,
                              isCorrect:
                                  selectedAnswers[index] == answerIndex &&
                                      answerIndex == test.correctAnswerIndex,
                              onTap: () {
                                setState(() {
                                  if (!isAnswered[index]) {
                                    // Разрешаем ответить только один раз
                                    selectedAnswers[index] = answerIndex;
                                    isAnswered[index] =
                                        true; // Отметим, что на вопрос ответили
                                  }
                                });
                              },
                              isAnswered: isAnswered[
                                  index], // Передаем флаг, что на вопрос уже ответили
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width:
                  340, // Устанавливаем ширину кнопки на 100% от родительского контейнера
              child: ElevatedButton(
                onPressed: () {
                  _showResultDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      Color.fromRGBO(0, 162, 225, 1), // Цвет фона кнопки
                  padding: EdgeInsets.symmetric(
                      vertical: 12, horizontal: 15), // Внутренние отступы
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Закругленные углы
                  ),
                  elevation: 5, // Тень кнопки
                ),
                child: Text(
                  'Проверить',
                  style: TextStylesMain.alltxt,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
