import 'package:flutter/material.dart';
import 'package:it_lectory_3/core/theme_lection.dart';
import 'package:it_lectory_3/core/topic-provider.dart';
import 'package:it_lectory_3/widgets/list_theme_widget.dart';
import 'package:provider/provider.dart';

Widget _buildLectureList(BuildContext context, String lectureName) {
  return ListWidget(
    namel: lectureName,
    lecturesData: lecturesData,
    onItemSelected: (Lecture selectedLecture) {
      context.read<TopicProvider>().selectTopic(
        selectedLecture.title,
        selectedLecture.content,
      );
      Navigator.pushNamed(context, '/lth');
    },
  );
}

Widget _buildLectureList1(BuildContext context, String lectureName) {
  return ListWidget(
    namel: lectureName,
    lecturesData: lecturesData,
    onItemSelected: (Lecture selectedLecture) {
      context.read<TopicProvider>().selectTopic(
        selectedLecture.title,
        selectedLecture.content,
      );
      Navigator.pushNamed(context, '/lth');
    },
  );
}