import 'package:flutter/material.dart';
import 'package:it_lectory_3/core/theme_lection.dart';


class LectureCard extends StatelessWidget {
  final Lecture lecture;

  const LectureCard({required this.lecture, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lecture.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              lecture.content,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}