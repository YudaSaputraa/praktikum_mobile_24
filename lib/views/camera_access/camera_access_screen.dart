import 'dart:io';

import 'package:flutter/material.dart';
import 'image_picker_helper.dart';

class CameraAccessScreen extends StatefulWidget {
  const CameraAccessScreen({super.key});

  @override
  State<CameraAccessScreen> createState() => _CameraAccessScreenState();
}

class _CameraAccessScreenState extends State<CameraAccessScreen> {
  String _imagePath = "";
  final ImagePickerHelper _imagePickerHelper = ImagePickerHelper();

  void _pickImageFromGallery() {
    _imagePickerHelper.getImageFromGallery((String? path) {
      if (path != null) {
        setState(() {
          _imagePath = path;
        });
      }
    });
  }

  void _pickImageFromCamera() {
    _imagePickerHelper.getImageFromCamera((String? path) {
      if (path != null) {
        setState(() {
          _imagePath = path;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Pickers"),
      ),
      body: Center(
        child: Column(
          children: [
            IconButton(
              onPressed: _pickImageFromGallery,
              icon: Icon(Icons.insert_drive_file),
            ),
            SizedBox(height: 10),
            IconButton(
              onPressed: _pickImageFromCamera,
              icon: Icon(Icons.camera_alt),
            ),
            _imagePath.isEmpty
                ? Container()
                : Image.file(
                    File(_imagePath),
                    height: 300,
                    width: 300,
                  ),
          ],
        ),
      ),
    );
  }
}
