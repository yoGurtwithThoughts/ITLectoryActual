import 'package:flutter/material.dart';
import 'package:it_lectory_3/pages/students/home_page.dart';
import 'package:it_lectory_3/widgets/style_text.dart';

class AllButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  AllButton({required this.buttonText, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(buttonText, style: TextStylesMain.labeltxt,),
    );
  }
}