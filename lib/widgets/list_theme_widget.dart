import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:it_lectory_3/core/theme_lection.dart';

class ListWidget extends StatelessWidget {
  final String namel;
  final Map<String, List<Lecture>> lecturesData;
  final Function(Lecture) onItemSelected;

  const ListWidget({
    super.key,
    required this.namel,
    required this.lecturesData,
    required this.onItemSelected,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Color.fromRGBO(53, 51, 51, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.transparent),
        ),
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/images/bookclosed.svg',
              height: 35,
            ),
            SizedBox(width: 5),
            Expanded(
              child: Text(namel, style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
        trailing: SvgPicture.asset(
          'assets/images/chevrondown.svg',
          height: 20,
        ),
        children: lecturesData.keys.map((topic) {
          return GestureDetector(
            onTap: () {
              final selectedLecture = lecturesData[topic]?.first;
              if (selectedLecture != null) {
                onItemSelected(selectedLecture);
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 2.5),
              padding: EdgeInsets.all(10),
              height: 60,
              width: 340,
              decoration: BoxDecoration(
                color: Color.fromRGBO(33, 33, 33, 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(topic, style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          );
        }).toList(),
      ),
    );
  }
}