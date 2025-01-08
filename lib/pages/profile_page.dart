import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:it_lectory_3/widgets/appbar_widget.dart';
import 'package:it_lectory_3/widgets/profile-image.dart';
import 'package:it_lectory_3/widgets/style_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _userName = "Ваше имя"; // Имя пользователя
  final TextEditingController _nameController = TextEditingController();

  // Метод для редактирования имени
  void _editName() {
    _nameController.text = _userName;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Редактировать имя"),
          content: TextField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: "Введите ваше имя"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Отмена"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _userName = _nameController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text("Сохранить"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Распределение элементов
            children: [
              Expanded(
                child: AppBarWidget(
                  text: 'Профиль',
                  isBack: true,
                ),
              ),
              InkWell(
                onTap: _editName,
                child: SvgPicture.asset(
                  'assets/icons/Edit.svg',
                  height: 50,
                  width: 50,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 85),
              UserProfile(),
              const SizedBox(height: 20),
              Text(
                _userName,
                style: TextStylesMain.themetxt
                ),
            ],
          )
        ],
      ),
    );
  }
}