import 'package:flutter/material.dart';

class TopicProvider with ChangeNotifier {
  String? selectedTitle;
  String? selectedContent;



  void selectTopic(String title, String content) {
    selectedTitle = title;
    selectedContent = content;
    notifyListeners();
  }
}