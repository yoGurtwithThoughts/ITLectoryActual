import 'package:flutter/material.dart';
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
                _buildLectureList(context, 'Основы WPF'),
                const SizedBox(height: 25),
                const TitleWidget(title: 'Язык разметки XAML и \nконтейнеры компоновки'),
                const SizedBox(height: 15),
                _buildLectureList(context, 'Основы XAML'),
                const SizedBox(height: 25),
                const TitleWidget(title: 'Привязка данных и элементы управления'),
                const SizedBox(height: 25),
                _buildLectureList(context, 'Введение в WPF'),
                const SizedBox(height: 25),
                _buildLectureList(context, 'Элементы управления (Controls)'),
                const SizedBox(height: 15),
                const TitleWidget(title: 'Графика и визуализация'),
                const SizedBox(height: 15),
                _buildLectureList(context, 'Введение в WPF'),
                const SizedBox(height: 25),
                _buildLectureList(context, 'Рисование и 2D графика'),
                const SizedBox(height: 25),
                _buildLectureList(context, 'Анимация'),
                const SizedBox(height: 25),
                _buildLectureList(context, 'Стили и шаблоны'),
                const SizedBox(height: 25),
                const TitleWidget(title: 'События и паттерн MVVM'),
                const SizedBox(height: 25),
                _buildLectureList(context, 'Основы событий и их обработка'),
                const SizedBox(height: 25),
                _buildLectureList(context, 'Паттерн MVVM'),
                const SizedBox(height: 25),
                _buildLectureList(context, 'Команды и взаимодействие с пользователем'),
                const SizedBox(height: 25),
                const TitleWidget(title: 'Расширенные возможности WPF'),
                const SizedBox(height: 25),
                _buildLectureList(context, 'Работа с мультимедия'),
                const SizedBox(height: 25),
                _buildLectureList(context, 'Документы и печать'),
                const SizedBox(height: 25),
                _buildLectureList(context, 'Оптимизация и производительность'),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Метод для создания списка лекций
  Widget _buildLectureList(BuildContext context, String lectureName) {
    return ListWidget(
      namel: lectureName,
      lecturesData: lecturesData,
      onItemSelected: (Lecture selectedLecture) {
        context.read<TopicProvider>().selectTopic(
          selectedLecture.title,
          selectedLecture.content,
        );
        Navigator.pushNamed(context, '/lth'); // Убедитесь, что у вас есть маршрут с именем '/lth'
      },
    );
  }
}