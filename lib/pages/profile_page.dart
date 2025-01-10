import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:it_lectory_3/widgets/appbar_widget.dart';
import 'package:it_lectory_3/widgets/profile-image.dart';
import 'package:it_lectory_3/widgets/style_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _userName = "Ваше имя";
  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? "Ваше имя";
    });
  }

  Future<void> _saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
  }
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
              onPressed: () async {
                setState(() {
                  _userName = _nameController.text;
                });
                await _saveUserName(_userName);
                Navigator.of(context).pop();
              },
              child: const Text("Сохранить"),
            ),
          ],
        );
      },
    );
  }
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppBarWidget(
                  text: 'Профиль',
                  isBack: false,
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