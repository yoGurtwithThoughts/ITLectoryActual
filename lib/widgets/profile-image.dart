import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProfile extends StatefulWidget {
  final double size;

  const UserProfile({Key? key, this.size = 150.0}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
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

        ],
      ),
    );
  }
}
