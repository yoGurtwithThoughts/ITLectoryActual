import 'package:flutter/material.dart';
import 'package:it_lectory_3/widgets/style_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({super.key,
  required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/images/PlayLabel.svg', height: 25,
        width:25,),
        SizedBox(width: 25,),
        Text(title, style: TextStylesMain.alltxt,
                    softWrap: true,
                    maxLines: 3,),


      ],
    );
  }
}
