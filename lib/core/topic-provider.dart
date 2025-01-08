import 'package:flutter/material.dart';
import 'package:it_lectory_3/core/theme_lection.dart';

class TopicProvider with ChangeNotifier {
  String? selectedTitle;
  String? selectedContent;


  void selectTopic(String title, String content) {
    selectedTitle = title;
    selectedContent = content;
    notifyListeners();
  }
}