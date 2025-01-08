import 'package:flutter/material.dart';

class Topic {
  final String name;
  final String content;

  Topic({required this.name, required this.content});
}

class TopicProvider extends ChangeNotifier {
  String? _selectedTitle;
  String? _selectedContent;

  String? get selectedTitle => _selectedTitle;
  String? get selectedContent => _selectedContent;

  void selectTopic(String title, String content) {
    _selectedTitle = title;
    _selectedContent = content;
    notifyListeners();
  }
}