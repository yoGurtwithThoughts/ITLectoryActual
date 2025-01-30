import 'package:flutter/material.dart';
import 'package:it_lectory_3/core/test-infomation-data.dart';

class TestProvider with ChangeNotifier {
  String? _selectedTitle;
  List<Test>? _selectedTests;

  // Add a getter for wpfTests
  List<WpfTest> _wpfTests = [
    // Add your predefined tests here
  ];

  List<WpfTest> get wpfTests => _wpfTests;

  String? get selectedTitle => _selectedTitle;
  List<Test>? get selectedTests => _selectedTests;

  void selectTopic(String title, List<Test> tests) {
    _selectedTitle = title;
    _selectedTests = tests;
    notifyListeners();
  }
}
