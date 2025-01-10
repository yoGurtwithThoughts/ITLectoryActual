import 'package:flutter/material.dart';
import 'package:it_lectory_3/widgets/style_text.dart';

class AppBarWidget extends StatelessWidget {
  final bool isBack;
  final String text;

  const AppBarWidget({
    super.key,
    required this.text,
    required this.isBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: isBack
          ? IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: const Color.fromRGBO(0, 85, 150, 1),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      )
          : null,
      title: isBack
          ? null
          : Text(
        text,
        style: TextStylesMain.apptxt,
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
    );
  }
}
