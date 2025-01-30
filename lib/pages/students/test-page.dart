import 'package:flutter/material.dart';
import 'package:it_lectory_3/models/test-provider.dart';
import 'package:it_lectory_3/widgets/appbar_widget.dart';
import 'package:it_lectory_3/widgets/test-widget-card.dart'; // Импортируем TestCard
import 'package:it_lectory_3/models/test-details-page.dart'; // Импортируем TestDetailPage
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(text: 'Тесты', isBack: false),
            Consumer<TestProvider>(
              builder: (context, testProvider, child) {
                return Column(
                  children: [
                    // Loop through all WpfTest objects and create TestCards
                    for (var test in testProvider.wpfTests)
                      TestCard(
                        titleTest: test.title,
                        Tap: () {
                          // Select the topic (title and list of tests) in the provider
                          testProvider.selectTopic(test.title, test.tests);

                          // Navigate to the TestDetailPage
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