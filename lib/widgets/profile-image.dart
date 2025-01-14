import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  final double size;

  const UserProfile({Key? key, this.size = 150.0}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _loadImage(); // Загружаем картинку при старте
  }

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final file = File(pickedFile.path);
        final savedImage = await _saveImage(file);
        setState(() {
          _imageFile = savedImage;
        });
      }
    } catch (e) {
      debugPrint("Ошибка при выборе изображения: $e");
    }
  }

  Future<File?> _saveImage(File image) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = 'user_profile_image_${DateTime.now().millisecondsSinceEpoch}.png';
      final savedImage = await image.copy('${appDir.path}/$fileName');

      final prefs = await SharedPreferences.getInstance();
      List<String> imagePaths = prefs.getStringList('profileImages') ?? [];
      imagePaths.add(savedImage.path);
      await prefs.setStringList('profileImages', imagePaths);

      return savedImage;
    } catch (e) {
      debugPrint("Ошибка при сохранении изображения: $e");
      return null;
    }
  }

  Future<void> _loadImage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> imagePaths = prefs.getStringList('profileImages') ?? [];

      if (imagePaths.isNotEmpty) {
        // Загружаем последнее изображение (или первое, в зависимости от логики)
        setState(() {
          _imageFile = File(imagePaths.last); // Используем последний путь как актуальное изображение
        });
      }
    } catch (e) {
      debugPrint("Ошибка при загрузке изображений: $e");
    }
  }

  // Метод для удаления изображения
  Future<void> _deleteImage() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> imagePaths = prefs.getStringList('profileImages') ?? [];

    if (imagePaths.isNotEmpty && _imageFile != null) {
      imagePaths.remove(_imageFile!.path);
      await prefs.setStringList('profileImages', imagePaths);

      await _imageFile!.delete();
      setState(() {
        _imageFile = null;
      });

      debugPrint("Изображение удалено и из стека, и с устройства");
    }
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Удалить изображение?"),
          content: Text("Вы уверены, что хотите удалить фото профиля?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Отмена"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteImage(); // Удаляем изображение
              },
              child: Text("Удалить"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_imageFile != null) {
          _showDeleteDialog();
        } else {
          _pickImage();
        }
      },
      child: Column(
        children: [
          ClipOval(
            child: Container(
              width: widget.size,
              height: widget.size,
              color: Colors.grey[300],
              child: _imageFile != null
                  ? Image.file(
                _imageFile!,
                fit: BoxFit.cover,
                width: widget.size,
                height: widget.size,
              )
                  : Icon(
                Icons.person,
                size: widget.size * 0.6,
                color: Colors.grey[700],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}