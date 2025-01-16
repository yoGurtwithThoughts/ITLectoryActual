import 'package:flutter/material.dart';

class InfoBanner extends StatefulWidget {
  final String infoTxt;
  final String countInfo;

  const InfoBanner({super.key, required this.countInfo, required this.infoTxt});

  @override
  State<InfoBanner> createState() => _InfoBannerState();
}

class _InfoBannerState extends State<InfoBanner> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10), // Скругление углов
      child: Stack(
        children: [
          // Основной контейнер с цветным фоном
          Container(
            width: 115,
            height: 150,
            color: Color.fromRGBO(26, 26, 26, 1),
          ),
          // Правая граница
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 3, // Толщина границы
              color: Colors.blue, // Цвет границы
            ),
          ),
          // Нижняя граница
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 3, // Толщина границы
              color: Colors.blue, // Цвет границы
            ),
          ),
          // Основное содержимое
          Column(
            children: const [],
          ),
        ],
      ),
    );
  }
}
