import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:it_lectory_3/widgets/style_text.dart';

class TestCard extends StatefulWidget {
  final String titleTest;
  final void Function()? Tap;

  const TestCard({super.key, required this.titleTest, required this.Tap});

  @override
  State<TestCard> createState() => _TestCardState();
}

class _TestCardState extends State<TestCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.Tap,
      child: Container(
        height: 40,
        width: 340,
        decoration: BoxDecoration(
            color: Color.fromRGBO(53, 51, 51, 1),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'asstes/icons/play.svg',
              height: 25,
              width: 25,
            ),
            Center(
              child: Text(
                widget.titleTest,
                style: TextStylesMain.themetxt,
              ),
            )
          ],
        ),
      ),
    );
  }
}
