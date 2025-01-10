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
    _loadImage();
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
      final fileName = 'user_profile_image.png';
      final savedImage = await image.copy('${appDir.path}/$fileName');

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profileImagePath', savedImage.path);

      return savedImage;
    } catch (e) {
      debugPrint("Ошибка при сохранении изображения: $e");
      return null;
    }
  }

  Future<void> _loadImage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final imagePath = prefs.getString('profileImagePath');

      if (imagePath != null && File(imagePath).existsSync()) {
        setState(() {
          _imageFile = File(imagePath);
        });
      }
    } catch (e) {
      debugPrint("Ошибка при загрузке изображения: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
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
          const Text("Нажмите, чтобы изменить фото"),
        ],
      ),
    );
  }
}