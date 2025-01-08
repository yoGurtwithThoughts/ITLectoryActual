import 'package:flutter/material.dart';
import 'package:it_lectory_3/core/topic-provider.dart';
import 'package:provider/provider.dart';
import 'package:it_lectory_3/widgets/style_text.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LectureThemePage extends StatefulWidget {
  @override
  _LectureThemePageState createState() => _LectureThemePageState();
}

class _LectureThemePageState extends State<LectureThemePage>
    with SingleTickerProviderStateMixin {
        late AnimationController _controller;
        late Animation<double> _animation;

        @override
        void initState() {
          super.initState();
          _controller = AnimationController(
            duration: const Duration(seconds: 1),
            vsync: this,
          );
          _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
          _controller.forward(); // Запуск анимации при инициализации
        }

        @override
        void dispose() {
          _controller.dispose(); // Освобождение ресурсов
          super.dispose();
        }
  Widget build(BuildContext context) {
    final topicProvider = Provider.of<TopicProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          topicProvider.selectedTitle ?? 'Тема',
          style: TextStylesMain.buttontxt,
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(), // Добавлено для плавной прокрутки
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildContent(topicProvider.selectedContent),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(String? content) {
    return Container(
      width: double.infinity,
      child: AutoSizeText(
        content ?? '',
        style: TextStylesMain.themetxt,
        textAlign: TextAlign.justify,
        maxLines: 450, // Установите максимальное количество строк по вашему желанию
        overflow: TextOverflow.clip, // Или используйте другие параметры переполнения
      ),
    );
  }
}