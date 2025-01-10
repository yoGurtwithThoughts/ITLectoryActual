import 'package:flutter/material.dart';
import 'package:it_lectory_3/core/lection_theme_data.dart';
import 'package:it_lectory_3/core/topic-provider.dart';
import 'package:it_lectory_3/core/theme_lection.dart';
import 'package:it_lectory_3/widgets/appbar_widget.dart';
import 'package:it_lectory_3/widgets/list_theme_widget.dart';
import 'package:provider/provider.dart';

import 'title_widget.dart';

class THomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 35),
          const AppBarWidget(
            text: 'Введение в WPF',
            isBack: false,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 35),
            child: Column(
              children: [
                const TitleWidget(title: 'Основы WPF'),
                const SizedBox(height: 25),
                _buildLectureList(context, StartWPF, lecturesData),
                const SizedBox(height: 25),
                const TitleWidget(title: 'Язык разметки XAML и \nконтейнеры компоновки'),
                const SizedBox(height: 15),
                _buildLectureList(context, XAMLStart, lecturesData1),
                const SizedBox(height: 25),
                const TitleWidget(title: 'Привязка данных и элементы управления'),
                const SizedBox(height: 25),
                _buildLectureList(context, ControlsElement, lecturesData),
                const SizedBox(height: 25),
                const TitleWidget(title: 'Графика и визуализация'),
                const SizedBox(height: 15),
                _buildLectureList(context, Draving, lecturesData),
                const SizedBox(height: 25),
                _buildLectureList(context, Dravingg, lecturesData),
                const SizedBox(height: 25),
                _buildLectureList(context, Dravinggg, lecturesData),
                const SizedBox(height: 25),
                const TitleWidget(title: 'События и паттерн MVVM'),
                const SizedBox(height: 25),
                _buildLectureList(context, RMVVM, lecturesData),
                const SizedBox(height: 25),
                _buildLectureList(context, RMVVMM, lecturesData),
                const SizedBox(height: 25),
                _buildLectureList(context, RMVVMMM, lecturesData),
                const SizedBox(height: 25),
                const TitleWidget(title: 'Расширенные возможности WPF'),
                const SizedBox(height: 25),
                _buildLectureList(context, WPFV, lecturesData),
                const SizedBox(height: 25),
                _buildLectureList(context, WPFVc, lecturesData),
                const SizedBox(height: 25),
                _buildLectureList(context, WPFVcc, lecturesData),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Функция для построения списка лекций
  Widget _buildLectureList(BuildContext context, List<String> topics, Map<String, List<Lecture>> lecturesData) {
    return Column(
      children: topics.map((topic) {
        // Получаем список лекций для данной темы
        List<Lecture> lectures = lecturesData[topic] ?? []; // Если нет лекций для этой темы, передаем пустой список
        return ListWidget(
          namel: topic,
          lecturesData: lectures, // Передаем список лекций для темы
          onItemSelected: (Lecture selectedLecture) {
            context.read<TopicProvider>().selectTopic(
              selectedLecture.title,
              selectedLecture.content,
            );
            Navigator.pushNamed(context, '/lth');
          },
        );
      }).toList(),
    );
  }
}