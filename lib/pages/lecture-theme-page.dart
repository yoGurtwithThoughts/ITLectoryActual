import 'package:flutter/material.dart';
import 'package:it_lectory_3/core/topic-provider.dart';
import 'package:provider/provider.dart';
import 'package:it_lectory_3/widgets/style_text.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LectureThemePage extends StatefulWidget {
  final bool isBack;
  const LectureThemePage({Key? key, this.isBack = true}) : super(key: key);
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
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Освобождение ресурсов
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TopicProvider>( 
      builder: (context, topicProvider, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              topicProvider.selectedTitle ?? 'Тема',
              style: TextStylesMain.buttontxt,
              textAlign: TextAlign.center,
            ),
            leading: widget.isBack
                ? InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
                child: Icon(Icons.arrow_back_ios,color: Color.fromRGBO(0, 85, 150, 1),)
            )
                : SizedBox(width: 24),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
      },
    );
  }

  Widget _buildContent(String? content) {
    return FadeTransition(
      opacity: _animation, // Плавный переход
      child: Container(
        width: double.infinity,
        child: AutoSizeText(
          content ?? '', // Контент для отображения
          style: TextStylesMain.themetxt,
          textAlign: TextAlign.justify,
          maxLines: 450, // Ограничение по строкам
          overflow: TextOverflow.clip, // Поведение текста при переполнении
        ),
      ),
    );
  }
}