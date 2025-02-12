import 'package:flutter/material.dart';
import 'package:it_lectory_3/core/test-infomation-data.dart';
import 'package:it_lectory_3/widgets/appbar_widget.dart';
import 'package:it_lectory_3/widgets/test-widget-card.dart'; 
import 'package:it_lectory_3/models/test-details-page.dart'; 
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 35),
            const AppBarWidget(text: 'Тесты', isBack: false),
            const SizedBox(height: 35),
            Consumer<WpfTestProvider>(
              builder: (context, testProvider, child) {
                return Column(
                  children: [
                    for (var test in testProvider.wpfTests)
                      TestCard(
                        titleTest: test.title,
                        onTap: () {
                          testProvider.selectTest(
                              test.title, test.tests); 
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestDetailPage(
                                title: test.title,
                                tests: test.tests,
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
